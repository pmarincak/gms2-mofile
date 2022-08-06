#ifdef MOFILE_EXPORTS
#define MOFILE_API __declspec(dllexport)
#else
#define MOFILE_API __declspec(dllimport)
#endif

class MOFILE_API CMofile {
public:
	CMofile(void);
};

extern MOFILE_API int nMofile;

MOFILE_API int fnMofile(void);
