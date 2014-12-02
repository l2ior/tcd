#include <queue>
#include <algorithm> // for max_element
#include <string>    // for strcmp, strcpy
#include <cstring>   // for memset
#include <math.h>    // for floor and pow
using namespace std;

#define IS_REAL_2D(P) (!mxIsComplex(P) && mxGetNumberOfDimensions(P) == 2)

// structure of a rectangle set
struct Rset {
  short lo[4]; // B1_lo, E1_lo, B2_lo, E2_lo
  short hi[4]; // B1_hi, E1_hi, B2_hi, E2_hi
  bool  bValid;
  
  void disp() {
    mexPrintf("lo=[%d,%d,%d,%d], hi=[%d,%d,%d,%d], bValid=%d\n", \
            lo[0],lo[1],lo[2],lo[3], hi[0],hi[1],hi[2],hi[3], bValid);
  }

  void setValid(bool vv) {
    bValid = vv;
  }

  bool isValid() {
    return bValid;
  }

};
struct State {
  float bound;
  Rset R;
  
  void disp() {
    mexPrintf("lb=%e, lo=[%d,%d,%d,%d], hi=[%d,%d,%d,%d]\n", bound,\
            R.lo[0],R.lo[1],R.lo[2],R.lo[3], R.hi[0],R.hi[1],R.hi[2],R.hi[3]);
  }
};

// Comparator of the priority queue
class CompareState {
public:
  bool operator () (const State& R1, const State& R2) {
    if (R1.bound > R2.bound) return true;
    return false;
  }
};

// Utility functions
void  printUsg();
void  split(const Rset& R, Rset& R1, Rset& R2);
void  rectify(Rset& R);
void  copyR(Rset& Rin, Rset& Rout);
void  copyS(State& Sin, State& Sout);
void  updateR(Rset& rect, Rset& R, const short m, const short n, Rset& R1, Rset& R2);
int   getBounds(float* S1r, float* S2r, const short& B, const Rset& R, float& lb, float& ub, const string dist);
int   maxside(const Rset& R);
int   getParams(const int nrhs, const mxArray *prhs[], short& L, unsigned int& maxIter, short& nRes, string& dist, bool& isVerbose);
bool  isvalid(const Rset& R, const short L);
bool  isUniqR(const Rset& R);
bool  isOverlap(Rset& rect, Rset& R);
void  vSub(const float* v1, const float* v2, const short& B, float** out);
float vSum(const float* v, const short& B);
template<typename T> void setField(mxArray** A, const int structIdx, const char* fieldname, const int size, mxClassID mxType, const T* value);
template<typename T> bool ismember(T a, T interval_begin, T interval_end);
