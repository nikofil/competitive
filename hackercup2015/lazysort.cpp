#include <iostream>
#include <deque>

using namespace std;

bool is_poss(int init, deque<int> v, bool front) {
    int min = init, max = init;
    bool change = true;
    if (front)
        v.pop_front();
    else
        v.pop_back();
    for (auto &i : v)
        cerr << i << " ";
    cerr << endl;
    while (change && !v.empty()) {
        change = false;
        if ((!v.empty()) && v.front() == min-1) {
            min--;
            v.pop_front();
            change = true;
        }
        if ((!v.empty()) && v.front() == max+1) {
            max++;
            v.pop_front();
            change = true;
        }
        if ((!v.empty()) && v.back() == min-1) {
            min--;
            v.pop_back();
            change = true;
        }
        if ((!v.empty()) && v.back() == max+1) {
            max++;
            v.pop_back();
            change = true;
        }
    }
    return v.empty();
}

int main() {
    int cases, icase;
    cin >> cases;
    for (icase = 1; icase <= cases; icase++) {
        int n;
        cin >> n;
        deque<int> v;
        for (int i = 0; i < n; i++) {
            int t;
            cin >> t;
            v.push_back(t);
        }
        cout << "Case #"<<icase<<": "<< ((is_poss(v.front(),v,true)||is_poss(v.back(),v,false))?"yes":"no") <<endl;
    }
    return 0;
}