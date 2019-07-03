/* src/config.h.  Generated from config.h.in by CMake.  */

/* Template for config.h.in based on config.h generated by autotools for
   mcpp 2.7.2 with unused definitions left out. */

#define COMPILER @mcpp_compiler@

/* Define the cpu-specific-macro. */
#define CPU "@mcpp_cpu@"

/* Define gcc major version. */
@mcpp_gcc_major_version_define@

/* Define gcc minor version. */
@mcpp_gcc_minor_version_define@

/* Define to 1 if the system has the type `intmax_t'. */
#define HAVE_INTMAX_T @mcpp_have_intmax_t@

/* Define to 1 if you have the <inttypes.h> header file. */
#define HAVE_INTTYPES_H @mcpp_have_inttypes_h@

/* Define to 1 if the system has the type `long long'. */
#define HAVE_LONG_LONG @mcpp_have_long_long@

/* Define to 1 if you have the <stdint.h> header file. */
#define HAVE_STDINT_H @mcpp_have_stdint_h@

/* Define to 1 if you have the `stpcpy' function. */
#define HAVE_STPCPY @mcpp_have_stpcpy@

/* Define the host compiler name. */
#define HOST_CMP_NAME "@mcpp_host_cmp_name@"

/* Define the host compiler. */
#define HOST_COMPILER @mcpp_host_compiler@

/* Define the host system. */
#define HOST_SYSTEM @mcpp_host_system@

/* Define printf length modifier for the longest integer. */
#define LL_FORM "@mcpp_ll_form@"

/* Define the target system. */
#define SYSTEM @mcpp_system@
