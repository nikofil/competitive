#include <iostream>
#include <vector>
#include <cstdint>
#include <cmath>

using namespace std;

uint64_t fac(uint64_t n) {
    uint64_t r = 1;
    if (n <= 1)
        return r;
    while (n > 1)
        r *= n--;
    return r;
}

int main() {
    int cases;
    cin >> cases;
    double *dp[21];
    for (int i = 0; i < 21; i++)
        dp[i] = new double[100000];
    for (int ccase = 1; ccase <= cases; ccase++) {
        double pp[21][21], p;
        cin >> p;
        for (int n = 0; n <= 20; n++)
            for (int k = 0; k <= n; k++) {
                uint64_t coef = fac(n)/fac(k)/fac(n-k);
                pp[k][n] = coef*pow(p, k)*pow(1-p, n-k);
            }
        // pp[0][0] = 0;
        for (int i = 0; i < 21; i++)
            dp[i][0] = pp[i][20];
        for (int i = 1; i < 100000; i++) {
            for (int l = 0; l < 21; l++) {
                dp[l][i] = 0;
                for (int j = 0; j <= l; j++) {
                    dp[l][i] += dp[j][i-1] * pp[l-j][20-j];
                }
            }
        }
        double res = 0;
        double den = 0;
        for (int i = 100000-1; i > 0; i--) {
            dp[20][i] -= dp[20][i-1];
        }
        for (int i = 0; i < 100000; i++) {
            res += (i+1)*dp[20][i];
            den += dp[20][i];
        }
        for (int i = 0; i < 51; i++)
            cerr << i << ":" << dp[20][i] << " ";
        cerr << endl;
        cout << fixed;
        cout.precision(5);
        cout << "Case #"<<ccase<<": "<< res/den << endl;
    }
    return 0;
}