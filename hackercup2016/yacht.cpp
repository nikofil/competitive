#include <iostream>
#include <cstdint>
#include <vector>

using namespace std;

int main() {
    int cases, icase;
    cin >> cases;
    for (icase = 1; icase <= cases; icase++) {
        double ret = 0;
        uint64_t i, parts, from, to, total = 0, entire_denom = 0, minmade, maxmade, final_denom = 0;
        cin >> parts >> from >> to;
        vector<uint64_t> v(parts);
        double expect_entire = 0, expect_entire_nom = 0, final_nom = 0;
        for (i = 0; i < parts; i++) {
            cin >> v[i];
            total += v[i];
            expect_entire_nom += ((double)v[i]*v[i]) / 2;
            entire_denom += v[i];
        }
        expect_entire = expect_entire_nom / entire_denom;
        minmade = from / total;
        maxmade = to / total;
        auto fromf = from % total, tof = to % total;
        if (fromf <= tof && maxmade == minmade) {
            i = 0;
            while (fromf >= v[i]) {
                fromf -= v[i];
                tof -= v[i];
                i++;
            }
            if (tof <= v[i]) {
                final_nom = ((double)(tof*tof - fromf*fromf))/2;
                final_denom = tof - fromf;
            } else {
                final_nom = ((double)(v[i]*v[i]-fromf*fromf))/2;
                final_denom = v[i] - fromf;
                tof -= v[i];
                while (tof > v[i]) {
                    final_nom += ((double)v[i]*v[i]) / 2;
                    final_denom += v[i];
                    tof -= v[i];
                    i++;
                }
                final_nom += ((double)tof*tof) / 2;
                final_denom += tof;
            }
            //final_nom += (maxmade-minmade)* expect_entire_nom;
            //final_denom += (maxmade-minmade)* entire_denom;

        } else {
            i = 0;
            while (tof >= v[i]) {
                final_nom += ((double)v[i]*v[i]) / 2;
                final_denom += v[i];
                tof -= v[i];
                // fromf -= v[i];
                i++;
            }
            final_nom += ((double)tof*tof) / 2;
            final_denom += tof;
            i = 0;
            while (fromf >= v[i]) {
                fromf -= v[i];
                i++;
            }
            final_nom += ((double)(v[i]*v[i]-fromf*fromf))/2;
            final_denom += v[i] - fromf;
            i++;
            while (i < parts) {
                final_nom += ((double)v[i]*v[i]) / 2;
                final_denom += v[i];
                i++;
            }
            //if (fromf >= tof) {
                maxmade--;
                cerr << "hi" << endl;   
            //}
            // cerr << final_nom << " " << final_denom << endl;
            // cerr << maxmade-minmade << " " << expect_entire_nom<< " "<<entire_denom << endl;
            // cerr << " Mdff " << maxmade-minmade << " " << final_nom/final_denom << endl;
            final_nom += (maxmade-minmade)*expect_entire_nom;
            final_denom += (maxmade-minmade)*entire_denom;
        }
        cout.precision(9);
        cout << fixed;
        cout << "Case #"<<icase<<": "<< final_nom / final_denom << endl;
    }
    return 0;
}
/*
sum [ (max*max-min*min)/2 ] / sum [ max-min ]
 */