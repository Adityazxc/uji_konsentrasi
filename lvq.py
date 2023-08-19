import math
from preprocessing import data_latih
import pandas as pd

class LVQ:
    def winner(self, weights, sample):
        D0 = 0
        D1 = 0
        
        for i in range(len(sample)):
            D0 = D0 + math.pow((sample[i] - weights[0][i]), 2)
            D1 = D1 + math.pow((sample[i] - weights[1][i]), 2)
            
        if D0 > D1:
            return 0
        else:
            return 1

    def update(self, weights, sample, J, alpha, actual):
        if actual == J:  # Fixed comparison operator
            for i in range(len(weights[0])):  # Use len(weights[0]) instead of len(weights)
                weights[J][i] = weights[J][i] + alpha * (sample[i] - weights[J][i])
        else:
            for i in range(len(weights[0])):  # Use len(weights[0]) instead of len(weights)
                weights[J][i] = weights[J][i] - alpha * (sample[i] - weights[J][i])

def main():
    X =data_latih.iloc[:, :-1].values
    Y = data_latih['target'].values
    x=X[:8]
    y=Y[:8]
    print(x,y)

    m, n = len(x), len(x[0])
    # bobot diambil dari data ke 9 dan 10
    weights = [X[8], X[9]]
    print(weights)
    
    # Bobot awal tidak digunakan untuk data traning
    m = m - 2
    
    ob = LVQ()
    epochs = 14
    initial_alpha = 0.05
    decay_rate= 0.8
        
    for i in range(epochs):
        current_alpha= initial_alpha * (decay_rate ** i)        
        for j in range(m):
            T = x[j]
            J= ob.winner(weights, T)
            ob.update(weights, T, J, current_alpha, y[j])
       
        
    correct_predictions = 0
    total_predictions = len(x)
        
    for i in range(total_predictions):
        sample = x[i]
        true_label = y[i]
            
        predicted_class = ob.winner(weights, sample)
            
        if predicted_class == true_label:
            correct_predictions += 1
        
    accuracy = correct_predictions / total_predictions
    print("Accuracy on training data:", accuracy)

  
   
    return weights
