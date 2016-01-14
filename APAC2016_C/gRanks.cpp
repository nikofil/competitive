#include <iostream>
#include <vector>
#include <cstdint>
#include <algorithm>
#include <map>
using namespace std;

int main() {
    int cases;
    cin >> cases;
    for (int icase = 1; icase <= cases; icase++) {
        int scn, n;
        cin >> scn;
        vector<int> sc(scn);
        map<string, vector<int> > m;
        for (int i = 0; i < scn; i++)
            cin >> sc[i];
        cin >> n;
        for (int i = 0; i < n; i++) {
            int c;
            cin >> c;
            for (int l = 0; l < scn; l++) {
                string nam;
                cin >> nam;
                if (m[nam].size() == 0)
                    m[nam].push_back(0);
                m[nam].push_back(c * sc[l]);
            }
        }
        int bnum;
        vector<int> bests;
        cin >> bnum;
        // sort(m.begin(), m.end());
        for (auto &it : m) {
           sort(it.second.begin(), it.second.end()); 
           int r = 0;
           for (int j = 1; j <= bnum && j < it.second.size(); j++)
               it.second[0] += it.second[j];
           bests.push_back(-it.second[0]);
        }
        sort(bests.begin(), bests.end());
        cout << "Case #"<<icase<<":"<<endl;
        for (int i = 0; i < m.size(); i++) {
            if (i > 0 && bests[i] == bests[i-1])
                continue;
            for (auto &it : m)
                if (-it.second[0] == bests[i]) {
                    cout << i+1 << ": " << it.first << endl;
                    // break;
                }
        }
    }
}
