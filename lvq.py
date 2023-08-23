import math
from preprocessing import data_latih


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
        if actual == J:
            for i in range(len(weights[0])):
                weights[J][i] = weights[J][i] + alpha * (sample[i] - weights[J][i])
        else:
            for i in range(len(weights[0])):
                weights[J][i] = weights[J][i] - alpha * (sample[i] - weights[J][i])
def train_lvq(x, y, initial_alpha=0.05, decay_rate=0.8, epochs=14):
    m, n = len(x), len(x[0])
    weights = [x[8], x[9]]
    m = m - 2
    
    ob = LVQ()
    
    for i in range(epochs):
        current_alpha = initial_alpha * (decay_rate ** i)
        for j in range(m):
            T = x[j]
            J = ob.winner(weights, T)
            ob.update(weights, T, J, current_alpha, y[j])
    
    return weights
def main():
    X = data_latih.iloc[:, :-1].values
    Y = data_latih['target'].values
    x = X[:8]
    y = Y[:8]

    m, n = len(x), len(x[0])
    weights = [X[8], X[9]]
    m = m - 2
    
    ob = LVQ()
    epochs = 14
    initial_alpha = 0.05
    decay_rate = 0.8
        
    for i in range(epochs):
        current_alpha = initial_alpha * (decay_rate ** i)        
        for j in range(m):
            T = x[j]
            J = ob.winner(weights, T)
            ob.update(weights, T, J, current_alpha, y[j])
        
    return weights
