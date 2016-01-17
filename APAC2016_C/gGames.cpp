#include <iostream>
#include <vector>

using namespace std;

class trip {
public:
    int e1;
    int e2;
    int bit;

    trip(int e1, int e2, int bit) : e1(e1), e2(e2), bit(bit) {
    }
};

int N, M;
vector<trip> *v;
vector<bool> *check;
vector<int> *places;

bool place_ith(int i) {
    cerr << "place "<<i<<endl;
    if (i == (1<<N)) {
        for (int i = 0; i < (1<<N); i++)
            cerr << (*places)[i] << ", ";
        cerr << endl;
        for (trip &t : *v)
            cerr << t.e1 << "|" << t.e2 <<"@" << t.bit << " ";
        cerr << endl;
        return true;
    }
    if (!(*check)[i])
        return place_ith(i+1);
    for (int j = 0; j < (1<<N); j++) {
        if ((*places)[j] != -1)
            continue;
        bool conflict = false;
        for (trip &tmp : *v) {
            int ee = -1;
            if (tmp.e1 == i && tmp.e2 < i)
                ee = tmp.e2;
            if (tmp.e2 == i && tmp.e1 < i)
                ee = tmp.e1;
            if (ee == -1)
                continue;
            int bit = tmp.bit;
            for (int k = 0; k < (1<<N); k++)
                if ((*places)[k] == ee) {
                    if ((k >> bit) == (j >> bit)) {
                        conflict = true;
                        goto loopout;
                    }
                    break;
                }
        }
        loopout:
        if (!conflict) {
            (*places)[j] = i;
            bool res = place_ith(i+1);
            (*places)[j] = -1;
            if (res)
                return true;
        }
    }
    return false;
}

int main() {
    int cases;
    cin >> cases;
    for (int ccase = 1; ccase <= cases; ccase++) {
        v = new vector<trip>();
        cin >> N >> M;
        check = new vector<bool>(1<<N);
        places = new vector<int>(1<<N);
        for (int i = 0; i < (1<<N); i++) {
            (*check)[i] = false;
            (*places)[i] = -1;
        }
        for (int i = 0; i < M; i++) {
            int e1, bit, flen;
            cin >> e1 >> bit >> flen;
            (*check)[e1-1] = true;
            for (int j = 0; j < flen; j++) {
                int e2;
                cin >> e2;
                (*check)[e2-1] = true;
                v->push_back(trip(e1-1, e2-1, bit));
                cerr << e1-1 << "|" << e2-1 << "@" << bit << endl;
            }
        }
        cout << "Case #"<<ccase<<": "<< (place_ith(0)?"YES":"NO") << endl;
        delete v;
    }
    return 0;
}