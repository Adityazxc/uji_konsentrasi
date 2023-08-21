import pandas as pd



# Atribut A, B dan G didapat dari rata-rata gelombang Alpha beta dan Gamma

def atribut_gelombang(data_mentah):
    data_mentah['A']=(data_mentah[' Alpha1']+data_mentah[' Alpha2'])/2
    data_mentah['B']=(data_mentah[' Beta1']+data_mentah[' Beta2'])/2
    data_mentah['G']=(data_mentah[' Gamma1']+data_mentah[' Gamma2'])/2    
    return data_mentah




def normalisasi(data_mentah):

# membatasi data ke 11 hingga ke 70
    filter_data= data_mentah.loc[10:69]

    # Dari gelombang Alpha
    min_A=filter_data['A'].min()
    max_A=filter_data['A'].max()

    # Dari gelombang Beta
    min_B=filter_data['B'].min()
    max_B=filter_data['B'].max()

    # Dari gelombang Gamma
    min_G=filter_data['G'].min()
    max_G=filter_data['G'].max()

    data_mentah['An']=(data_mentah['A']-min_A)/(max_A-min_A)
    data_mentah['Bn']=(data_mentah['B']-min_B)/(max_B-min_B)
    data_mentah['Gn']=(data_mentah['G']-min_G)/(max_G-min_G)
    return data_mentah

# normalisasi(data_mentah)
# print(data_mentah)

import math


def ekstraksi_gelombang(data_mentah):
    # Koefisien high pass
    high_h0 = (1 - math.sqrt(3)) / (4 * math.sqrt(2))
    high_h1 = (3 - math.sqrt(3)) / (4 * math.sqrt(2))
    high_h2 = (3 + math.sqrt(3)) / (4 * math.sqrt(2))
    high_h3 = (1 + math.sqrt(3)) / (4 * math.sqrt(2))

    # Koefisien low pass
    low_h0 = (1 + math.sqrt(3)) / (4 * math.sqrt(2))
    low_h1 = (3 + math.sqrt(3)) / (4 * math.sqrt(2))
    low_h2 = (3 - math.sqrt(3)) / (4 * math.sqrt(2))
    low_h3 = (1 - math.sqrt(3)) / (4 * math.sqrt(2))

    # Ekstraksi Alpha
    def ekstraksi_Alpha(data, high_h0, high_h1, high_h2, high_h3, low_h0, low_h1, low_h2, low_h3):
        a1 = data
        a2 = data
        for _ in range(4):
            a1 = (a1 * low_h0) + (a1 * low_h1) 
            a2 = (a2 * low_h2) + (a2 * low_h3)
        a1 = (a1 * high_h0) + (a1 * high_h1) 
        a2 = (a2 * high_h2) + (a2 * high_h3)    
        return a1 + a2

    # Ekstraksi Betalow
    def ekstraksi_Betalow(data, high_h0, high_h1, high_h2, high_h3, low_h0, low_h1, low_h2, low_h3):
        a1 = data
        a2 = data
        for _ in range(3):
            a1 = (a1 * low_h0) + (a1 * low_h1) 
            a2 = (a2 * low_h2) + (a2 * low_h3)
        a1 = (a1 * high_h0) + (a1 * high_h1) 
        a2 = (a2 * high_h2) + (a2 * high_h3) 
        return a1 + a2

    # Ekstraksi BetaHigh
    def ekstraksi_BetaHigh(data, high_h0, high_h1, high_h2, high_h3, low_h0, low_h1, low_h2, low_h3):
        a1 = data
        a2 = data
        for _ in range(4):
            a1 = (a1 * low_h0) + (a1 * low_h1) 
            a2 = (a2 * low_h2) + (a2 * low_h3)
        a1 = (a1 * high_h0) + (a1 * high_h1) 
        a2 = (a2 * high_h2) + (a2 * high_h3)  
        return a1 + a2
        
    # Ekstraksi Gamma
    def ekstraksi_Gamma(data, high_h0, high_h1, high_h2, high_h3, low_h0, low_h1, low_h2, low_h3):
        a1 = data
        a2 = data
        for _ in range(2):
            a1 = (a1 * low_h0) + (a1 * low_h1) 
            a2 = (a2 * low_h2) + (a2 * low_h3)
        a1 = (a1 * high_h0) + (a1 * high_h1) 
        a2 = (a2 * high_h2) + (a2 * high_h3)  
        return a1 + a2

    # Ekstraksi gelombang untuk setiap kolom
    data_mentah['Ae'] = ekstraksi_Alpha(data_mentah['An'], high_h0, high_h1, high_h2, high_h3, low_h0, low_h1, low_h2, low_h3)
    data_mentah['Be0'] = ekstraksi_Betalow(data_mentah['Bn'], high_h0, high_h1, high_h2, high_h3, low_h0, low_h1, low_h2, low_h3)
    data_mentah['Be1'] = ekstraksi_BetaHigh(data_mentah['Bn'], high_h0, high_h1, high_h2, high_h3, low_h0, low_h1, low_h2, low_h3)
    data_mentah['Ge'] = ekstraksi_Gamma(data_mentah['Gn'], high_h0, high_h1, high_h2, high_h3, low_h0, low_h1, low_h2, low_h3)

    return data_mentah

    
# print(ekstraksi_gelombang(data_mentah))


def gelombang_otak(data_mentah):
    #seleksi data dari urutan daka ke 11 hingga 70
    data_bersih=data_mentah.iloc[9:70]

    #mengisi nilai rata-rata

    rA=data_bersih['Ae'].mean()
    rB=data_bersih['Be1'].mean()
    rG=data_bersih['Ge'].mean()

    #mengisi nilai standar deviasi

    stdA = data_bersih['Ae'].std().mean()
    stdB = data_bersih['Be1'].std().mean()
    stdG = data_bersih['Ge'].std().mean()

    #mengisi nilai absolute

    absA=data_bersih['Ae'].abs().mean()
    absB=data_bersih['Be1'].abs().mean()
    absG=data_bersih['Ge'].abs().mean()
    
    # target
    def data_target(rA,rB):
        if min(rA,rB)==rA:
            return 1
        else:
            return 0
    target=data_target(rA,rB)

    #membuat dataframe baru
    # data_gelombang_otak=[rA,rB,rG,stdA,stdB,stdG,absA,absB,absG,target]
    
    # Mengembalikan data dictionary agar bisa diamsukan ke tabel baru
    return {
        'rA': rA,
        'rB': rB,
        'rG': rG,
        'stdA': stdA,
        'stdB': stdB,
        'stdG': stdG,
        'absA': absA,
        'absB': absB,
        'absG': absG,
        'target':target,
    }

mentah=[
    'data/datafix/Anwar2.csv',
    'data/datafix/AnwarHigh.csv',
    'data/datafix/Ardi2.csv',
    'data/datafix/ArdiHigh.csv',
    'data/datafix/Asep2.csv',
    'data/datafix/AsepHigh.csv',
    'data/datafix/Indra2.csv',
    'data/datafix/IndraHigh.csv',
    'data/datafix/Teddy2.csv',
    'data/datafix/TeddyHigh.csv',
    'data/datafix/Zaenal2.csv',
    'data/datafix/ZaenalHigh.csv',
  

]

# data latih

#membuat dataframe baru
data_latih=['rA','rB','rG','stdA','stdB','stdG','absA','absB','absG','target']

# membuat variabel untuk menampung data_latih
data_latih=pd.DataFrame(columns=data_latih)


# fungsi persiapan data (mengubah data mentah menjadi data siap uji)
def persiapan_data(df):   
    atribut_gelombang(df)
    normalisasi(df)
    ekstraksi_gelombang(df)
    hasil=gelombang_otak(df)
    return hasil

for data in mentah:
    hasil_data=pd.read_csv(data)
    result=persiapan_data(hasil_data)

    # tambahkan fungsi concat untuk menambahkan hasil perhitungan ke dalam data_latih
    data_latih=pd.concat([data_latih, pd.DataFrame([result])],ignore_index=True)









