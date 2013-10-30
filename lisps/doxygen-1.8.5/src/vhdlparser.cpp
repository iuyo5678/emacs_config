/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton implementation for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.3"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Using locations.  */
#define YYLSP_NEEDED 0

/* Substitute the variable and function names.  */
#define yyparse vhdlScanYYparse
#define yylex   vhdlScanYYlex
#define yyerror vhdlScanYYerror
#define yylval  vhdlScanYYlval
#define yychar  vhdlScanYYchar
#define yydebug vhdlScanYYdebug
#define yynerrs vhdlScanYYnerrs


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     t_ABSTRLIST = 258,
     t_CHARLIST = 259,
     t_DIGIT = 260,
     t_STRING = 261,
     t_LETTER = 262,
     t_ACCESS = 263,
     t_AFTER = 264,
     t_ALIAS = 265,
     t_ALL = 266,
     t_AND = 267,
     t_ARCHITECTURE = 268,
     t_ARRAY = 269,
     t_ASSERT = 270,
     t_ATTRIBUTE = 271,
     t_BEGIN = 272,
     t_BLOCK = 273,
     t_BODY = 274,
     t_BUFFER = 275,
     t_BUS = 276,
     t_CASE = 277,
     t_COMPONENT = 278,
     t_CONFIGURATION = 279,
     t_CONSTANT = 280,
     t_DISCONNECT = 281,
     t_DOWNTO = 282,
     t_ELSE = 283,
     t_ELSIF = 284,
     t_END = 285,
     t_ENTITY = 286,
     t_EXIT = 287,
     t_FILE = 288,
     t_FOR = 289,
     t_FUNCTION = 290,
     t_GENERATE = 291,
     t_GENERIC = 292,
     t_GUARDED = 293,
     t_IF = 294,
     t_IN = 295,
     t_INOUT = 296,
     t_IS = 297,
     t_LABEL = 298,
     t_LIBRARY = 299,
     t_LINKAGE = 300,
     t_LOOP = 301,
     t_MAP = 302,
     t_NAND = 303,
     t_NEW = 304,
     t_NEXT = 305,
     t_NOR = 306,
     t_NULL = 307,
     t_OF = 308,
     t_ON = 309,
     t_OPEN = 310,
     t_OR = 311,
     t_OTHERS = 312,
     t_OUT = 313,
     t_PACKAGE = 314,
     t_PORT = 315,
     t_PROCEDURE = 316,
     t_PROCESS = 317,
     t_RANGE = 318,
     t_RECORD = 319,
     t_REGISTER = 320,
     t_REPORT = 321,
     t_RETURN = 322,
     t_SELECT = 323,
     t_SEVERITY = 324,
     t_SIGNAL = 325,
     t_SUBTYPE = 326,
     t_THEN = 327,
     t_TO = 328,
     t_TRANSPORT = 329,
     t_TYPE = 330,
     t_UNITS = 331,
     t_UNTIL = 332,
     t_USE = 333,
     t_VARIABLE = 334,
     t_WAIT = 335,
     t_WHEN = 336,
     t_WHILE = 337,
     t_WITH = 338,
     t_XOR = 339,
     t_IMPURE = 340,
     t_PURE = 341,
     t_GROUP = 342,
     t_POSTPONED = 343,
     t_SHARED = 344,
     t_XNOR = 345,
     t_SLL = 346,
     t_SRA = 347,
     t_SLA = 348,
     t_SRL = 349,
     t_ROR = 350,
     t_ROL = 351,
     t_UNAFFECTED = 352,
     t_ASSUME_GUARANTEE = 353,
     t_ASSUME = 354,
     t_CONTEXT = 355,
     t_COVER = 356,
     t_DEFAULT = 357,
     t_FAIRNESS = 358,
     t_FORCE = 359,
     t_INERTIAL = 360,
     t_LITERAL = 361,
     t_PARAMETER = 362,
     t_PROTECTED = 363,
     t_PROPERTY = 364,
     t_REJECT = 365,
     t_RELEASE = 366,
     t_RESTRICT = 367,
     t_RESTRICT_GUARANTEE = 368,
     t_SEQUENCE = 369,
     t_STRONG = 370,
     t_VMODE = 371,
     t_VPROP = 372,
     t_VUNIT = 373,
     t_SLSL = 374,
     t_SRSR = 375,
     t_QQ = 376,
     t_QGT = 377,
     t_QLT = 378,
     t_QG = 379,
     t_QL = 380,
     t_QEQU = 381,
     t_QNEQU = 382,
     t_GESym = 383,
     t_GTSym = 384,
     t_LESym = 385,
     t_LTSym = 386,
     t_NESym = 387,
     t_EQSym = 388,
     t_Ampersand = 389,
     t_Minus = 390,
     t_Plus = 391,
     MED_PRECEDENCE = 392,
     t_REM = 393,
     t_MOD = 394,
     t_Slash = 395,
     t_Star = 396,
     MAX_PRECEDENCE = 397,
     t_NOT = 398,
     t_ABS = 399,
     t_DoubleStar = 400,
     t_Apostrophe = 401,
     t_LeftParen = 402,
     t_RightParen = 403,
     t_Comma = 404,
     t_VarAsgn = 405,
     t_Colon = 406,
     t_Semicolon = 407,
     t_Arrow = 408,
     t_Box = 409,
     t_Bar = 410,
     t_Dot = 411,
     t_Q = 412,
     t_At = 413,
     t_Neg = 414,
     t_LEFTBR = 415,
     t_RIGHTBR = 416,
     t_ToolDir = 417
   };
#endif
/* Tokens.  */
#define t_ABSTRLIST 258
#define t_CHARLIST 259
#define t_DIGIT 260
#define t_STRING 261
#define t_LETTER 262
#define t_ACCESS 263
#define t_AFTER 264
#define t_ALIAS 265
#define t_ALL 266
#define t_AND 267
#define t_ARCHITECTURE 268
#define t_ARRAY 269
#define t_ASSERT 270
#define t_ATTRIBUTE 271
#define t_BEGIN 272
#define t_BLOCK 273
#define t_BODY 274
#define t_BUFFER 275
#define t_BUS 276
#define t_CASE 277
#define t_COMPONENT 278
#define t_CONFIGURATION 279
#define t_CONSTANT 280
#define t_DISCONNECT 281
#define t_DOWNTO 282
#define t_ELSE 283
#define t_ELSIF 284
#define t_END 285
#define t_ENTITY 286
#define t_EXIT 287
#define t_FILE 288
#define t_FOR 289
#define t_FUNCTION 290
#define t_GENERATE 291
#define t_GENERIC 292
#define t_GUARDED 293
#define t_IF 294
#define t_IN 295
#define t_INOUT 296
#define t_IS 297
#define t_LABEL 298
#define t_LIBRARY 299
#define t_LINKAGE 300
#define t_LOOP 301
#define t_MAP 302
#define t_NAND 303
#define t_NEW 304
#define t_NEXT 305
#define t_NOR 306
#define t_NULL 307
#define t_OF 308
#define t_ON 309
#define t_OPEN 310
#define t_OR 311
#define t_OTHERS 312
#define t_OUT 313
#define t_PACKAGE 314
#define t_PORT 315
#define t_PROCEDURE 316
#define t_PROCESS 317
#define t_RANGE 318
#define t_RECORD 319
#define t_REGISTER 320
#define t_REPORT 321
#define t_RETURN 322
#define t_SELECT 323
#define t_SEVERITY 324
#define t_SIGNAL 325
#define t_SUBTYPE 326
#define t_THEN 327
#define t_TO 328
#define t_TRANSPORT 329
#define t_TYPE 330
#define t_UNITS 331
#define t_UNTIL 332
#define t_USE 333
#define t_VARIABLE 334
#define t_WAIT 335
#define t_WHEN 336
#define t_WHILE 337
#define t_WITH 338
#define t_XOR 339
#define t_IMPURE 340
#define t_PURE 341
#define t_GROUP 342
#define t_POSTPONED 343
#define t_SHARED 344
#define t_XNOR 345
#define t_SLL 346
#define t_SRA 347
#define t_SLA 348
#define t_SRL 349
#define t_ROR 350
#define t_ROL 351
#define t_UNAFFECTED 352
#define t_ASSUME_GUARANTEE 353
#define t_ASSUME 354
#define t_CONTEXT 355
#define t_COVER 356
#define t_DEFAULT 357
#define t_FAIRNESS 358
#define t_FORCE 359
#define t_INERTIAL 360
#define t_LITERAL 361
#define t_PARAMETER 362
#define t_PROTECTED 363
#define t_PROPERTY 364
#define t_REJECT 365
#define t_RELEASE 366
#define t_RESTRICT 367
#define t_RESTRICT_GUARANTEE 368
#define t_SEQUENCE 369
#define t_STRONG 370
#define t_VMODE 371
#define t_VPROP 372
#define t_VUNIT 373
#define t_SLSL 374
#define t_SRSR 375
#define t_QQ 376
#define t_QGT 377
#define t_QLT 378
#define t_QG 379
#define t_QL 380
#define t_QEQU 381
#define t_QNEQU 382
#define t_GESym 383
#define t_GTSym 384
#define t_LESym 385
#define t_LTSym 386
#define t_NESym 387
#define t_EQSym 388
#define t_Ampersand 389
#define t_Minus 390
#define t_Plus 391
#define MED_PRECEDENCE 392
#define t_REM 393
#define t_MOD 394
#define t_Slash 395
#define t_Star 396
#define MAX_PRECEDENCE 397
#define t_NOT 398
#define t_ABS 399
#define t_DoubleStar 400
#define t_Apostrophe 401
#define t_LeftParen 402
#define t_RightParen 403
#define t_Comma 404
#define t_VarAsgn 405
#define t_Colon 406
#define t_Semicolon 407
#define t_Arrow 408
#define t_Box 409
#define t_Bar 410
#define t_Dot 411
#define t_Q 412
#define t_At 413
#define t_Neg 414
#define t_LEFTBR 415
#define t_RIGHTBR 416
#define t_ToolDir 417




/* Copy the first part of user declarations.  */


#include <stdio.h>
#include <qcstring.h>
#include <qstringlist.h>
#include "config.h"

#ifndef YYSTYPE
typedef int YYSTYPE;
#endif

struct  YYMM
{
  int itype;
  QCString qstr;
};

 


// define struct instead of union
#define YYSTYPE YYMM

#include "membergroup.h"
#include "vhdldocgen.h"
#include "doxygen.h"
#include "searchindex.h"
#include "vhdlscanner.h"
#include "commentscan.h"
#include "entry.h"
#include "arguments.h"
#include "memberdef.h"
#include "vhdldocgen.h"

//-----------------------------variables ---------------------------------------------------------------------------


    


static VhdlContainer s_str;

static QList<Entry>instFiles;
static QList<Entry>libUse;


static int yyLineNr;
static Entry* lastCompound;
static Entry* currentCompound;
static Entry* lastEntity;
static Entry* current;
static Entry* tempEntry;
static Entry* current_root;
static QCString compSpec;
static QCString currName;
static int levelCounter;
static QCString confName;
static QCString genLabels;
static QCString lab;
static QCString forL;
static QList<VhdlConfNode> configL;


static int currP=0;

enum  { GEN_SEC=0x1, PARAM_SEC,CONTEXT_SEC,PROTECTED_SEC } ;

static int param_sec = 0;
static int parse_sec=0;


//---------------------------- functions --------------------------------------------------------------------------------

int vhdlScanYYlex ();
void vhdlScanYYerror (char const *);

static void addVhdlType(const QCString &name,int startLine,
                        int section,uint64 spec,
			const char* args,const char* type,
			Protection prot=Public);
static void addCompInst(char *n, char* instName,char* comp,int line);

static void newEntry();
static void initEntry(Entry *e);


static void pushLabel(QCString &,QCString&);
static QCString popLabel(QCString&);
static void addConfigureNode(const char* a,const char*b,
                         bool isRoot,bool isLeave,bool inlineConf=FALSE);
//static bool addLibUseClause(const QCString &type);
static bool isFuncProcProced();
static void initEntry(Entry *e);
static void addProto(const char *s1,const char *s2,const char *s3,
                     const char *s4,const char *s5,const char *s6);
static void createFunction(const QCString &impure,uint64 spec,
                           const QCString &fname);

static void createFlow();    

void newVhdlEntry()
{
  newEntry();
}

Entry* getCurrentVhdlEntry()
{
  return current;
}

void initVhdlParser()
{
  lastCompound=0;
  lastEntity=0;
  currentCompound=0;
  lastEntity=0;
  current_root=s_str.root;
  current=new Entry();
  initEntry(current);
  libUse.clear();
}

QList<Entry> & getVhdlInstList()
{
  return instFiles;
}

QList<Entry> & getLibUse()
{
  return libUse;
}



/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif

#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */


#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int i)
#else
static int
YYID (i)
    int i;
#endif
{
  return i;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef _STDLIB_H
#      define _STDLIB_H 1
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined _STDLIB_H \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef _STDLIB_H
#    define _STDLIB_H 1
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss;
  YYSTYPE yyvs;
  };

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack)					\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack, Stack, yysize);				\
	Stack = &yyptr->Stack;						\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  26
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   2797

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  163
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  408
/* YYNRULES -- Number of rules.  */
#define YYNRULES  926
/* YYNRULES -- Number of states.  */
#define YYNSTATES  1595

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   417

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      95,    96,    97,    98,    99,   100,   101,   102,   103,   104,
     105,   106,   107,   108,   109,   110,   111,   112,   113,   114,
     115,   116,   117,   118,   119,   120,   121,   122,   123,   124,
     125,   126,   127,   128,   129,   130,   131,   132,   133,   134,
     135,   136,   137,   138,   139,   140,   141,   142,   143,   144,
     145,   146,   147,   148,   149,   150,   151,   152,   153,   154,
     155,   156,   157,   158,   159,   160,   161,   162
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     5,     7,     9,    11,    13,    16,    18,
      20,    22,    24,    26,    28,    30,    32,    34,    37,    38,
      40,    43,    45,    49,    52,    53,    56,    58,    60,    62,
      64,    66,    68,    70,    72,    74,    78,    82,    84,    88,
      93,   101,   105,   106,   108,   109,   112,   113,   116,   118,
     119,   120,   125,   126,   127,   132,   136,   144,   150,   156,
     157,   159,   162,   164,   165,   168,   170,   176,   177,   185,
     191,   192,   194,   196,   199,   200,   203,   205,   211,   217,
     221,   222,   224,   227,   229,   230,   232,   235,   237,   240,
     242,   245,   249,   255,   261,   266,   267,   269,   272,   276,
     277,   280,   282,   284,   286,   288,   290,   292,   294,   296,
     298,   300,   302,   304,   306,   308,   310,   312,   314,   316,
     318,   320,   322,   324,   326,   328,   330,   332,   334,   336,
     338,   340,   342,   344,   346,   348,   350,   352,   355,   357,
     359,   361,   363,   365,   367,   369,   371,   373,   375,   377,
     379,   381,   383,   385,   387,   389,   391,   393,   395,   397,
     399,   401,   403,   405,   407,   409,   411,   413,   415,   417,
     419,   424,   426,   428,   431,   432,   437,   438,   446,   447,
     454,   456,   459,   460,   464,   465,   468,   469,   472,   474,
     476,   478,   479,   489,   496,   497,   499,   501,   503,   506,
     509,   512,   513,   516,   518,   523,   527,   528,   531,   534,
     536,   538,   541,   549,   550,   553,   554,   556,   558,   559,
     561,   562,   564,   566,   568,   570,   572,   574,   579,   580,
     583,   586,   591,   595,   599,   600,   603,   606,   610,   612,
     614,   616,   618,   622,   624,   626,   628,   630,   633,   635,
     637,   639,   641,   643,   645,   647,   649,   653,   657,   661,
     665,   669,   673,   677,   681,   685,   689,   693,   697,   701,
     704,   706,   709,   712,   715,   718,   722,   727,   731,   735,
     739,   743,   747,   751,   755,   759,   763,   767,   771,   775,
     779,   783,   787,   791,   795,   799,   803,   806,   809,   811,
     815,   817,   819,   821,   823,   827,   829,   831,   833,   835,
     837,   840,   843,   847,   849,   851,   853,   855,   857,   861,
     863,   865,   867,   869,   871,   873,   875,   877,   881,   883,
     885,   887,   890,   893,   895,   899,   904,   908,   912,   916,
     919,   925,   930,   934,   940,   944,   949,   953,   956,   957,
     959,   960,   962,   966,   968,   971,   972,   975,   978,   980,
     982,   984,   989,   994,   998,   999,  1002,  1004,  1006,  1008,
    1010,  1012,  1014,  1016,  1018,  1020,  1022,  1027,  1028,  1031,
    1034,  1041,  1044,  1046,  1047,  1050,  1052,  1055,  1060,  1068,
    1069,  1072,  1075,  1079,  1084,  1085,  1087,  1094,  1095,  1098,
    1100,  1105,  1108,  1112,  1118,  1122,  1125,  1127,  1128,  1130,
    1134,  1137,  1141,  1142,  1144,  1147,  1152,  1153,  1156,  1159,
    1161,  1163,  1165,  1169,  1171,  1175,  1177,  1179,  1186,  1187,
    1190,  1198,  1199,  1202,  1203,  1205,  1212,  1220,  1221,  1224,
    1226,  1228,  1230,  1233,  1235,  1237,  1239,  1241,  1249,  1256,
    1258,  1260,  1261,  1264,  1273,  1280,  1281,  1286,  1287,  1289,
    1297,  1300,  1302,  1304,  1305,  1308,  1311,  1317,  1325,  1330,
    1333,  1335,  1337,  1338,  1341,  1344,  1346,  1348,  1350,  1352,
    1354,  1356,  1358,  1360,  1362,  1364,  1366,  1368,  1370,  1372,
    1374,  1376,  1378,  1380,  1382,  1384,  1391,  1399,  1400,  1404,
    1409,  1410,  1413,  1418,  1424,  1426,  1428,  1430,  1435,  1441,
    1444,  1446,  1447,  1450,  1452,  1454,  1456,  1458,  1460,  1462,
    1464,  1466,  1467,  1483,  1484,  1486,  1487,  1490,  1492,  1493,
    1498,  1503,  1504,  1509,  1510,  1515,  1516,  1521,  1522,  1524,
    1526,  1530,  1533,  1535,  1539,  1541,  1543,  1545,  1546,  1556,
    1557,  1566,  1575,  1585,  1586,  1590,  1594,  1596,  1601,  1604,
    1608,  1610,  1615,  1618,  1622,  1624,  1629,  1632,  1637,  1640,
    1644,  1646,  1652,  1654,  1658,  1664,  1667,  1669,  1670,  1673,
    1676,  1679,  1680,  1683,  1686,  1688,  1691,  1693,  1695,  1698,
    1699,  1701,  1705,  1707,  1708,  1710,  1719,  1724,  1725,  1728,
    1733,  1734,  1737,  1739,  1742,  1743,  1752,  1757,  1761,  1762,
    1768,  1772,  1774,  1777,  1780,  1784,  1788,  1790,  1791,  1792,
    1804,  1809,  1810,  1814,  1815,  1817,  1818,  1820,  1821,  1823,
    1826,  1828,  1829,  1833,  1837,  1840,  1841,  1844,  1847,  1849,
    1850,  1853,  1855,  1857,  1860,  1862,  1864,  1866,  1868,  1870,
    1872,  1874,  1876,  1879,  1881,  1883,  1885,  1888,  1890,  1896,
    1902,  1903,  1906,  1907,  1910,  1911,  1913,  1914,  1916,  1918,
    1919,  1931,  1932,  1945,  1952,  1953,  1956,  1958,  1959,  1965,
    1966,  1977,  1978,  1979,  1983,  1984,  1987,  1988,  1994,  2003,
    2004,  2006,  2007,  2009,  2010,  2013,  2019,  2020,  2023,  2024,
    2026,  2032,  2033,  2036,  2037,  2039,  2042,  2045,  2049,  2050,
    2052,  2057,  2063,  2070,  2076,  2078,  2080,  2083,  2085,  2088,
    2090,  2093,  2097,  2102,  2108,  2109,  2112,  2113,  2116,  2117,
    2120,  2122,  2126,  2130,  2134,  2137,  2138,  2140,  2148,  2149,
    2153,  2154,  2158,  2159,  2168,  2174,  2175,  2178,  2180,  2181,
    2184,  2186,  2188,  2190,  2192,  2200,  2201,  2203,  2204,  2208,
    2213,  2217,  2222,  2230,  2233,  2238,  2241,  2245,  2247,  2249,
    2251,  2255,  2256,  2260,  2261,  2265,  2268,  2271,  2273,  2275,
    2277,  2279,  2283,  2292,  2300,  2308,  2311,  2312,  2314,  2316,
    2320,  2322,  2324,  2326,  2328,  2330,  2332,  2334,  2339,  2344,
    2345,  2348,  2350,  2352,  2355,  2357,  2359,  2361,  2363,  2369,
    2375,  2376,  2379,  2381,  2384,  2388,  2390,  2394,  2395,  2404,
    2411,  2413,  2416,  2418,  2421,  2423,  2425,  2427,  2435,  2444,
    2451,  2459,  2468,  2475,  2476,  2480,  2483,  2486,  2488,  2492,
    2494,  2497,  2500,  2510,  2519,  2528,  2534,  2539,  2542,  2544,
    2547,  2551,  2553,  2555,  2563,  2572,  2579,  2587,  2592,  2597,
    2600,  2610,  2619,  2621,  2623,  2632,  2633,  2635,  2641,  2643,
    2648,  2658,  2659,  2661,  2663,  2665,  2669,  2671,  2677,  2682,
    2687,  2693,  2696,  2704,  2710,  2712,  2717,  2719,  2721,  2723,
    2725,  2729,  2736,  2744,  2746,  2748,  2749,  2752,  2755,  2756,
    2758,  2759,  2766,  2771,  2777,  2784,  2788,  2789,  2793,  2800,
    2802,  2804,  2806,  2808,  2810,  2812,  2816,  2819,  2823,  2826,
    2829,  2833,  2835,  2840,  2843,  2847,  2850
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     164,     0,    -1,   165,    -1,   166,    -1,   410,    -1,   235,
      -1,   174,    -1,   166,   174,    -1,   501,    -1,   503,    -1,
     504,    -1,   505,    -1,   502,    -1,   172,    -1,    52,    -1,
     505,    -1,   501,    -1,   171,   501,    -1,    -1,   504,    -1,
     504,   501,    -1,   501,    -1,   173,   149,   501,    -1,   175,
     176,    -1,    -1,   175,   177,    -1,   181,    -1,   196,    -1,
     202,    -1,   191,    -1,   208,    -1,   517,    -1,   522,    -1,
     178,    -1,   179,    -1,    44,   173,   152,    -1,    78,   180,
     152,    -1,   272,    -1,   180,   149,   272,    -1,   182,     1,
     469,   152,    -1,   182,   189,   187,   185,   184,   469,   152,
      -1,    31,   501,    42,    -1,    -1,   501,    -1,    -1,    17,
     360,    -1,    -1,   185,   186,    -1,   215,    -1,    -1,    -1,
      60,   188,   240,   152,    -1,    -1,    -1,    37,   190,   240,
     152,    -1,    37,     1,   152,    -1,   192,   194,    17,   360,
      30,   193,   152,    -1,   192,     1,    30,   193,   152,    -1,
      13,   501,    53,   501,    42,    -1,    -1,   501,    -1,    13,
     501,    -1,    13,    -1,    -1,   194,   195,    -1,   216,    -1,
     198,     1,    30,   199,   152,    -1,    -1,   198,   200,   474,
      30,   199,   152,   197,    -1,    24,   501,    53,   501,    42,
      -1,    -1,   501,    -1,    24,    -1,    24,   501,    -1,    -1,
     200,   201,    -1,   222,    -1,   203,     1,    30,   204,   152,
      -1,   203,   205,    30,   204,   152,    -1,    59,   501,    42,
      -1,    -1,   501,    -1,    59,   501,    -1,    59,    -1,    -1,
     207,    -1,   205,   206,    -1,   218,    -1,   559,   152,    -1,
     559,    -1,   559,   558,    -1,   559,   558,   152,    -1,   209,
       1,    30,   210,   152,    -1,   209,   211,    30,   210,   152,
      -1,    59,    19,   501,    42,    -1,    -1,   501,    -1,    59,
      19,    -1,    59,    19,   501,    -1,    -1,   211,   212,    -1,
     219,    -1,   202,    -1,   522,    -1,   208,    -1,   523,    -1,
     288,    -1,   312,    -1,   325,    -1,   337,    -1,   334,    -1,
     224,    -1,   179,    -1,   214,    -1,   235,    -1,   344,    -1,
     345,    -1,   340,    -1,   327,    -1,   330,    -1,   496,    -1,
     495,    -1,   213,    -1,   214,    -1,   235,    -1,   471,    -1,
     344,    -1,   345,    -1,   485,    -1,   340,    -1,   327,    -1,
     330,    -1,   496,    -1,   495,    -1,   213,    -1,   570,    -1,
     216,    -1,   217,   216,    -1,   214,    -1,   471,    -1,   344,
      -1,   345,    -1,   340,    -1,   327,    -1,   330,    -1,   496,
      -1,   495,    -1,   202,    -1,   522,    -1,   523,    -1,   214,
      -1,   235,    -1,   330,    -1,   496,    -1,   495,    -1,   344,
      -1,   345,    -1,   213,    -1,   214,    -1,   235,    -1,   344,
      -1,   345,    -1,   330,    -1,   496,    -1,   495,    -1,   213,
      -1,   220,    -1,   345,    -1,   179,    -1,   495,    -1,    78,
     118,   173,   152,    -1,    86,    -1,    85,    -1,   225,   152,
      -1,    -1,    61,   501,   226,   234,    -1,    -1,   223,    35,
     167,   227,   233,    67,   271,    -1,    -1,    35,   167,   228,
     233,    67,   271,    -1,   559,    -1,   559,   558,    -1,    -1,
     107,   231,   240,    -1,    -1,   232,   240,    -1,    -1,   229,
     230,    -1,   230,    -1,   229,    -1,   233,    -1,    -1,   225,
      42,   238,   236,    17,   423,    30,   237,   152,    -1,   225,
      42,     1,    30,   237,   152,    -1,    -1,   167,    -1,    35,
      -1,    61,    -1,    61,   501,    -1,    35,   501,    -1,    35,
       6,    -1,    -1,   238,   239,    -1,   220,    -1,   147,   243,
     241,   148,    -1,   147,     1,   148,    -1,    -1,   241,   242,
      -1,   152,   243,    -1,   557,    -1,   550,    -1,   247,   501,
      -1,   247,   173,   151,   246,   313,   245,   244,    -1,    -1,
     150,   259,    -1,    -1,    20,    -1,    21,    -1,    -1,   248,
      -1,    -1,   332,    -1,    40,    -1,    58,    -1,    41,    -1,
      20,    -1,    45,    -1,   147,   255,   250,   148,    -1,    -1,
     250,   251,    -1,   149,   255,    -1,   147,   256,   253,   148,
      -1,   147,     1,   148,    -1,   147,    55,   148,    -1,    -1,
     253,   254,    -1,   149,   256,    -1,   257,   153,   258,    -1,
     258,    -1,   154,    -1,   102,    -1,   259,    -1,   287,   153,
     259,    -1,   322,    -1,   269,    -1,   259,    -1,    55,    -1,
     105,   259,    -1,   261,    -1,   262,    -1,    91,    -1,    92,
      -1,    93,    -1,    94,    -1,    95,    -1,    96,    -1,   262,
     260,   262,    -1,   262,    12,   262,    -1,   262,    84,   262,
      -1,   262,    56,   262,    -1,   262,    51,   262,    -1,   262,
      90,   262,    -1,   262,    48,   262,    -1,   261,    48,   262,
      -1,   261,    51,   262,    -1,   261,    90,   262,    -1,   261,
      12,   262,    -1,   261,    56,   262,    -1,   261,    84,   262,
      -1,   121,   268,    -1,   268,    -1,   136,   268,    -1,   135,
     268,    -1,   144,   268,    -1,   143,   268,    -1,   268,   145,
     268,    -1,   135,   268,   145,   268,    -1,   262,   139,   262,
      -1,   262,   138,   262,    -1,   262,   134,   262,    -1,   262,
     141,   262,    -1,   262,   136,   262,    -1,   262,   135,   262,
      -1,   262,   130,   262,    -1,   262,   128,   262,    -1,   262,
     131,   262,    -1,   262,   129,   262,    -1,   262,   133,   262,
      -1,   262,   132,   262,    -1,   262,   140,   262,    -1,   262,
     127,   262,    -1,   262,   126,   262,    -1,   262,   125,   262,
      -1,   262,   124,   262,    -1,   262,   123,   262,    -1,   262,
     122,   262,    -1,   135,   265,    -1,   136,   265,    -1,   265,
      -1,   263,   264,   265,    -1,   134,    -1,   135,    -1,   136,
      -1,   267,    -1,   267,   266,   267,    -1,   141,    -1,   138,
      -1,   139,    -1,   140,    -1,   268,    -1,   144,   268,    -1,
     143,   268,    -1,   268,   145,   268,    -1,   269,    -1,   168,
      -1,   277,    -1,   279,    -1,   280,    -1,   147,   259,   148,
      -1,   271,    -1,   270,    -1,   561,    -1,   503,    -1,   276,
      -1,   274,    -1,   501,    -1,   272,    -1,   269,   156,   273,
      -1,   167,    -1,   505,    -1,    11,    -1,   271,   252,    -1,
     270,   252,    -1,   146,    -1,   271,   275,   501,    -1,   276,
     147,   259,   148,    -1,   270,   275,   501,    -1,   271,   275,
      63,    -1,   270,   275,    63,    -1,   278,   148,    -1,   147,
     284,   153,   259,   148,    -1,   147,   283,   149,   283,    -1,
     278,   149,   283,    -1,   271,   146,   147,   259,   148,    -1,
     271,   146,   277,    -1,    49,   271,   271,   282,    -1,    49,
     271,   281,    -1,    49,   279,    -1,    -1,   252,    -1,    -1,
     252,    -1,   284,   153,   259,    -1,   259,    -1,   287,   285,
      -1,    -1,   285,   286,    -1,   155,   287,    -1,   259,    -1,
     322,    -1,    57,    -1,    75,   501,     1,   152,    -1,    75,
     501,   289,   152,    -1,    75,     1,   152,    -1,    -1,    42,
     290,    -1,   291,    -1,   317,    -1,   294,    -1,   300,    -1,
     304,    -1,   306,    -1,   310,    -1,   311,    -1,   506,    -1,
     511,    -1,   147,   169,   292,   148,    -1,    -1,   292,   293,
      -1,   149,   169,    -1,   317,    76,   298,   296,    30,   295,
      -1,    76,   501,    -1,    76,    -1,    -1,   296,   297,    -1,
     299,    -1,   501,   152,    -1,   501,   133,   170,   152,    -1,
      14,   147,   303,   301,   148,    53,   313,    -1,    -1,   301,
     302,    -1,   149,   303,    -1,   271,    63,   154,    -1,    14,
     318,    53,   313,    -1,    -1,   501,    -1,    64,   309,   307,
      30,    64,   305,    -1,    -1,   307,   308,    -1,   309,    -1,
     173,   151,   313,   152,    -1,     8,   313,    -1,    33,    53,
     271,    -1,    71,   501,    42,   313,   152,    -1,    71,     1,
     152,    -1,   271,   314,    -1,   315,    -1,    -1,   252,    -1,
     271,   271,   317,    -1,   271,   317,    -1,   271,   271,   316,
      -1,    -1,   252,    -1,    63,   323,    -1,   147,   321,   319,
     148,    -1,    -1,   319,   320,    -1,   149,   321,    -1,   313,
      -1,   323,    -1,   315,    -1,   259,   324,   259,    -1,   276,
      -1,   263,   324,   263,    -1,    73,    -1,    27,    -1,    25,
     173,   151,   313,   326,   152,    -1,    -1,   150,   259,    -1,
      70,   173,   151,   313,   329,   328,   152,    -1,    -1,   150,
     259,    -1,    -1,   333,    -1,    79,   173,   151,   313,   331,
     152,    -1,    89,    79,   173,   151,   313,   331,   152,    -1,
      -1,   150,   259,    -1,    25,    -1,    70,    -1,    79,    -1,
      89,    79,    -1,    33,    -1,    75,    -1,    21,    -1,    65,
      -1,    10,   335,   336,    42,   269,   524,   152,    -1,    10,
     335,   336,    42,     1,   152,    -1,   501,    -1,   503,    -1,
      -1,   151,   313,    -1,    33,   173,   151,   313,    42,   339,
     259,   152,    -1,    33,   173,   151,   501,   338,   152,    -1,
      -1,    55,   259,    42,   259,    -1,    -1,   248,    -1,    26,
     341,   151,   271,     9,   259,   152,    -1,   269,   342,    -1,
      57,    -1,    11,    -1,    -1,   342,   343,    -1,   149,   269,
      -1,    16,   501,   151,   271,   152,    -1,    16,   501,    53,
     346,    42,   259,   152,    -1,   347,   524,   151,   350,    -1,
     167,   348,    -1,    57,    -1,    11,    -1,    -1,   348,   349,
      -1,   149,   167,    -1,    31,    -1,    13,    -1,    59,    -1,
      24,    -1,    23,    -1,    43,    -1,    75,    -1,    71,    -1,
      61,    -1,    35,    -1,    70,    -1,    79,    -1,    25,    -1,
      87,    -1,    33,    -1,    76,    -1,   106,    -1,   114,    -1,
     109,    -1,   352,    -1,    39,   259,    36,   403,   354,   353,
      -1,    39,   463,   259,    36,   403,   354,   353,    -1,    -1,
      28,    36,   403,    -1,    28,   463,    36,   403,    -1,    -1,
     354,   355,    -1,    29,   259,    36,   403,    -1,    29,   463,
     259,    36,   403,    -1,   358,    -1,   358,    -1,   359,    -1,
      34,   501,    40,   321,    -1,    34,   463,   501,    40,   321,
      -1,    82,   259,    -1,   361,    -1,    -1,   361,   362,    -1,
     363,    -1,   364,    -1,   383,    -1,   384,    -1,   385,    -1,
     379,    -1,   404,    -1,   410,    -1,    -1,   501,   151,    18,
     365,   374,   373,   371,   369,   367,    17,   360,    30,    18,
     366,   152,    -1,    -1,   501,    -1,    -1,   367,   368,    -1,
     216,    -1,    -1,    60,   240,   152,   370,    -1,    60,    47,
     249,   152,    -1,    -1,    37,   240,   152,   372,    -1,    -1,
      37,    47,   249,   152,    -1,    -1,   147,   259,   148,   374,
      -1,    -1,    42,    -1,   501,    -1,   375,   156,   501,    -1,
     375,   377,    -1,   375,    -1,   147,   501,   148,    -1,    24,
      -1,    31,    -1,    23,    -1,    -1,   501,   151,   269,   380,
      37,    47,   249,   382,   152,    -1,    -1,   501,   151,   269,
     381,    60,    47,   249,   152,    -1,   501,   151,   378,   376,
      60,    47,   249,   152,    -1,   501,   151,   378,   376,    37,
      47,   249,   382,   152,    -1,    -1,    60,    47,   249,    -1,
     501,   151,   428,    -1,   428,    -1,   501,   151,    88,   428,
      -1,    88,   428,    -1,   501,   151,   458,    -1,   458,    -1,
     501,   151,    88,   458,    -1,    88,   458,    -1,   501,   151,
     386,    -1,   386,    -1,   501,   151,    88,   386,    -1,    88,
     386,    -1,   501,   151,    88,   398,    -1,    88,   398,    -1,
     501,   151,   398,    -1,   398,    -1,   394,   130,   395,   387,
     152,    -1,   388,    -1,   388,    81,   259,    -1,   388,    81,
     259,    28,   387,    -1,   391,   389,    -1,    97,    -1,    -1,
     389,   390,    -1,   149,   391,    -1,   259,   392,    -1,    -1,
       9,   259,    -1,    52,   393,    -1,    52,    -1,     9,   259,
      -1,   269,    -1,   277,    -1,   397,   396,    -1,    -1,    74,
      -1,   110,   259,   105,    -1,   105,    -1,    -1,    38,    -1,
      83,   259,    68,   394,   130,   395,   399,   152,    -1,   400,
     388,    81,   284,    -1,    -1,   400,   401,    -1,   388,    81,
     284,   149,    -1,    -1,   217,    17,    -1,    17,    -1,   402,
     360,    -1,    -1,   501,   151,   405,   356,    36,   402,   360,
     406,    -1,   409,    30,   408,   152,    -1,    30,   408,   152,
      -1,    -1,   501,   151,   407,   351,   406,    -1,   501,   151,
     528,    -1,    36,    -1,    36,   501,    -1,    30,   152,    -1,
      30,   501,   152,    -1,   501,   151,   411,    -1,   411,    -1,
      -1,    -1,   415,   412,    62,   419,   417,   413,    17,   423,
      30,   414,   152,    -1,     1,    30,   414,   152,    -1,    -1,
     415,    62,   416,    -1,    -1,    88,    -1,    -1,   501,    -1,
      -1,    42,    -1,   417,   418,    -1,   221,    -1,    -1,   147,
      11,   148,    -1,   147,   420,   148,    -1,   269,   421,    -1,
      -1,   421,   422,    -1,   149,   269,    -1,   424,    -1,    -1,
     424,   425,    -1,   426,    -1,   428,    -1,   463,   428,    -1,
     433,    -1,   451,    -1,   440,    -1,   447,    -1,   454,    -1,
     457,    -1,   458,    -1,   459,    -1,   463,   461,    -1,   461,
      -1,   462,    -1,   465,    -1,   463,   465,    -1,   427,    -1,
     450,    66,   259,   429,   152,    -1,    15,   259,   430,   429,
     152,    -1,    -1,    69,   259,    -1,    -1,    66,   259,    -1,
      -1,   157,    -1,    -1,   157,    -1,   501,    -1,    -1,    22,
     431,   259,   434,    42,   438,   436,    30,    22,   432,   152,
      -1,    -1,   463,    22,   431,   259,   435,    42,   438,   436,
      30,    22,   432,   152,    -1,    22,     1,    30,    22,   432,
     152,    -1,    -1,   436,   437,    -1,   438,    -1,    -1,    81,
     284,   153,   439,   423,    -1,    -1,    39,   259,    72,   441,
     423,   444,   442,    30,    39,   152,    -1,    -1,    -1,    28,
     443,   423,    -1,    -1,   444,   445,    -1,    -1,    29,   259,
      72,   446,   423,    -1,   450,   449,    46,   423,    30,    46,
     448,   152,    -1,    -1,   501,    -1,    -1,   357,    -1,    -1,
     501,   151,    -1,   450,    32,   453,   452,   152,    -1,    -1,
      81,   259,    -1,    -1,   501,    -1,   450,    50,   456,   455,
     152,    -1,    -1,    81,   259,    -1,    -1,   501,    -1,    52,
     152,    -1,   269,   152,    -1,    67,   460,   152,    -1,    -1,
     259,    -1,   394,   130,   388,   152,    -1,   394,   130,   543,
     388,   152,    -1,   394,   130,   104,   542,   259,   152,    -1,
     394,   130,   111,   542,   152,    -1,   536,    -1,   532,    -1,
     464,   152,    -1,   544,    -1,   463,   546,    -1,   546,    -1,
     501,   151,    -1,   394,   150,   259,    -1,   463,   394,   150,
     259,    -1,    80,   468,   467,   466,   152,    -1,    -1,    34,
     259,    -1,    -1,    77,   259,    -1,    -1,    54,   420,    -1,
      30,    -1,    30,    23,   183,    -1,    30,    13,   183,    -1,
      30,    31,   183,    -1,    30,   501,    -1,    -1,    42,    -1,
      23,   501,   470,   473,   472,   469,   152,    -1,    -1,    60,
     240,   152,    -1,    -1,    37,   240,   152,    -1,    -1,    34,
     480,   478,   476,   475,    30,    34,   152,    -1,    34,     1,
      30,    34,   152,    -1,    -1,   476,   477,    -1,   481,    -1,
      -1,   478,   479,    -1,   179,    -1,   269,    -1,   474,    -1,
     482,    -1,    34,   487,   484,   483,    30,    34,   152,    -1,
      -1,   474,    -1,    -1,   491,   490,   152,    -1,    78,   118,
     173,   152,    -1,    78,   489,   152,    -1,    34,   487,   486,
     152,    -1,    34,   487,   486,   152,    30,    34,   152,    -1,
      78,   489,    -1,    78,   118,   173,   152,    -1,   491,   490,
      -1,   488,   151,   259,    -1,   173,    -1,    11,    -1,    57,
      -1,   492,   491,   490,    -1,    -1,    60,    47,   249,    -1,
      -1,    37,    47,   249,    -1,    31,   269,    -1,    24,   271,
      -1,    55,    -1,   501,    -1,   505,    -1,   493,    -1,   494,
     149,   493,    -1,    87,   501,   151,   500,   147,   494,   148,
     152,    -1,    87,   501,    42,   147,   499,   148,   152,    -1,
      87,   501,    42,   147,     1,   152,   148,    -1,   350,   498,
      -1,    -1,   154,    -1,   497,    -1,   499,   149,   497,    -1,
     501,    -1,   503,    -1,     7,    -1,     5,    -1,     6,    -1,
       3,    -1,     4,    -1,   108,   507,    30,   509,    -1,   108,
       1,    30,   509,    -1,    -1,   507,   508,    -1,   510,    -1,
     108,    -1,   108,   501,    -1,   179,    -1,   345,    -1,   224,
      -1,   523,    -1,   108,    19,   512,    30,   514,    -1,   108,
      19,     1,    30,   514,    -1,    -1,   512,   513,    -1,   515,
      -1,   108,    19,    -1,   108,    19,   501,    -1,   220,    -1,
     100,   180,   152,    -1,    -1,   100,   501,    42,   518,   520,
      30,   519,   152,    -1,   100,   501,    42,    30,   519,   152,
      -1,   100,    -1,   100,   501,    -1,   521,    -1,   520,   521,
      -1,   179,    -1,   178,    -1,   516,    -1,    59,   501,    42,
      49,   375,   524,   152,    -1,    59,   501,    42,    49,   375,
     524,   558,   152,    -1,    59,     1,   501,    42,    49,   152,
      -1,    35,   501,    42,    49,   375,   524,   152,    -1,    35,
     501,    42,    49,   375,   524,   558,   152,    -1,    35,   501,
      42,    49,     1,   152,    -1,    -1,   160,   525,   161,    -1,
     160,   161,    -1,    67,   271,    -1,   526,    -1,   526,    67,
     271,    -1,   271,    -1,   526,   527,    -1,   149,   271,    -1,
      22,   259,    36,   530,   531,    30,    36,   408,   152,    -1,
      22,   259,    36,   530,    30,    36,   408,   152,    -1,    22,
       1,    36,     1,    30,    36,   408,   152,    -1,    81,   463,
     284,   153,   403,    -1,    81,   284,   153,   403,    -1,   530,
     529,    -1,   529,    -1,    30,   152,    -1,    30,   501,   152,
      -1,   533,    -1,   535,    -1,   394,   130,   391,    81,   259,
     534,   152,    -1,   394,   130,   543,   391,    81,   259,   534,
     152,    -1,   394,   130,   391,    81,   259,   152,    -1,   394,
     130,   543,   391,    81,   259,   152,    -1,   394,   130,     1,
     152,    -1,    28,   259,    81,   259,    -1,    28,   259,    -1,
     394,   130,   104,   542,   259,    81,   259,   545,   152,    -1,
     394,   130,   104,   542,   259,    81,   259,   152,    -1,   537,
      -1,   541,    -1,    83,   259,    68,   431,   394,   130,   538,
     539,    -1,    -1,   543,    -1,   391,    81,   284,   149,   539,
      -1,   540,    -1,   391,    81,   284,   152,    -1,    83,   259,
      68,   431,   394,   130,   104,   542,   547,    -1,    -1,    40,
      -1,    58,    -1,    74,    -1,   110,   259,   105,    -1,   105,
      -1,   464,    81,   259,   545,   152,    -1,   464,    81,   259,
     152,    -1,    28,   259,    81,   259,    -1,   545,    28,   259,
      81,   259,    -1,    28,   259,    -1,    83,   259,    68,   431,
     549,   150,   547,    -1,   259,    81,   284,   149,   547,    -1,
     548,    -1,   259,    81,   284,   152,    -1,   269,    -1,   277,
      -1,   551,    -1,   552,    -1,    61,   501,   555,    -1,    35,
     553,   555,    67,   271,   554,    -1,   223,    35,   553,   555,
      67,   271,   554,    -1,   501,    -1,   503,    -1,    -1,    42,
     501,    -1,    42,   154,    -1,    -1,   107,    -1,    -1,   107,
     556,   147,   243,   241,   148,    -1,   147,   243,   241,   148,
      -1,    59,   501,    42,    49,   375,    -1,    59,   501,    42,
      49,   375,   558,    -1,    37,    47,   249,    -1,    -1,    37,
     560,   240,    -1,   119,   562,   563,   151,   313,   120,    -1,
      25,    -1,    70,    -1,    79,    -1,   564,    -1,   565,    -1,
     569,    -1,   156,   568,   501,    -1,   156,   501,    -1,   566,
     568,   501,    -1,   566,   501,    -1,   159,   156,    -1,   566,
     159,   156,    -1,   501,    -1,   501,   147,   259,   148,    -1,
     567,   156,    -1,   568,   567,   156,    -1,   158,   375,    -1,
     162,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   400,   400,   403,   405,   406,   408,   409,   412,   413,
     416,   417,   418,   419,   420,   423,   424,   426,   428,   429,
     431,   433,   434,   441,   443,   444,   446,   447,   448,   449,
     450,   451,   452,   455,   456,   459,   468,   483,   484,   490,
     492,   495,   505,   506,   508,   509,   511,   512,   515,   517,
     518,   518,   520,   521,   521,   522,   526,   527,   529,   537,
     538,   539,   540,   542,   543,   545,   547,   548,   548,   556,
     563,   564,   569,   570,   571,   572,   573,   575,   576,   577,
     591,   592,   593,   594,   596,   597,   598,   599,   601,   602,
     603,   604,   606,   607,   608,   615,   616,   617,   618,   620,
     621,   622,   629,   630,   631,   632,   635,   636,   637,   638,
     639,   640,   641,   643,   644,   645,   646,   647,   648,   649,
     650,   651,   652,   655,   656,   657,   658,   659,   660,   661,
     662,   663,   664,   665,   666,   667,   669,   670,   673,   674,
     675,   676,   677,   678,   679,   680,   681,   682,   683,   684,
     686,   687,   688,   689,   690,   691,   692,   693,   695,   696,
     697,   698,   699,   700,   701,   702,   704,   706,   707,   708,
     709,   714,   715,   717,   720,   719,   727,   726,   739,   738,
     751,   752,   755,   754,   758,   758,   762,   763,   764,   765,
     767,   770,   769,   783,   787,   788,   789,   790,   791,   792,
     793,   795,   797,   799,   805,   806,   807,   808,   809,   811,
     819,   831,   838,   858,   859,   860,   861,   862,   863,   864,
     865,   866,   868,   869,   870,   871,   872,   874,   875,   876,
     877,   879,   885,   886,   888,   889,   890,   892,   893,   894,
     895,   898,   899,   900,   902,   904,   905,   906,   912,   913,
     915,   916,   917,   918,   919,   920,   922,   923,   924,   925,
     926,   927,   928,   929,   930,   931,   932,   933,   934,   938,
     939,   940,   941,   942,   943,   944,   945,   949,   950,   951,
     952,   953,   954,   955,   956,   957,   958,   959,   960,   961,
     962,   963,   964,   965,   966,   967,   969,   970,   971,   972,
     975,   976,   977,   980,   981,   984,   985,   986,   987,   989,
     990,   991,   992,   994,   995,   996,   997,   998,   999,  1001,
    1002,  1003,  1004,  1005,  1006,  1008,  1009,  1011,  1013,  1014,
    1015,  1017,  1018,  1020,  1023,  1024,  1025,  1026,  1027,  1029,
    1030,  1032,  1033,  1035,  1036,  1038,  1039,  1040,  1041,  1042,
    1043,  1044,  1051,  1052,  1054,  1055,  1056,  1057,  1059,  1060,
    1061,  1066,  1067,  1073,  1075,  1076,  1078,  1079,  1080,  1081,
    1082,  1083,  1084,  1085,  1086,  1087,  1090,  1091,  1092,  1093,
    1095,  1104,  1105,  1107,  1108,  1109,  1111,  1113,  1115,  1124,
    1125,  1126,  1128,  1130,  1132,  1133,  1135,  1147,  1148,  1152,
    1154,  1156,  1158,  1164,  1168,  1169,  1170,  1171,  1172,  1174,
    1175,  1176,  1177,  1178,  1180,  1183,  1186,  1187,  1189,  1191,
    1192,  1194,  1195,  1197,  1198,  1200,  1201,  1207,  1216,  1217,
    1219,  1224,  1225,  1226,  1227,  1229,  1234,  1239,  1240,  1242,
    1243,  1244,  1245,  1246,  1247,  1249,  1250,  1252,  1260,  1262,
    1263,  1265,  1266,  1269,  1274,  1280,  1281,  1284,  1285,  1287,
    1290,  1291,  1292,  1293,  1294,  1295,  1301,  1307,  1314,  1316,
    1317,  1318,  1319,  1320,  1321,  1323,  1324,  1325,  1326,  1327,
    1328,  1329,  1330,  1331,  1332,  1333,  1334,  1335,  1336,  1337,
    1338,  1339,  1340,  1341,  1348,  1350,  1351,  1353,  1354,  1355,
    1356,  1357,  1358,  1359,  1361,  1363,  1364,  1366,  1379,  1386,
    1396,  1397,  1398,  1399,  1401,  1402,  1403,  1404,  1405,  1409,
    1410,  1412,  1412,  1419,  1420,  1421,  1422,  1423,  1424,  1425,
    1427,  1428,  1429,  1430,  1431,  1432,  1433,  1434,  1435,  1437,
    1438,  1441,  1442,  1444,  1446,  1447,  1448,  1450,  1450,  1454,
    1454,  1459,  1463,  1467,  1468,  1470,  1471,  1473,  1474,  1476,
    1477,  1479,  1480,  1482,  1483,  1485,  1486,  1488,  1489,  1491,
    1492,  1494,  1496,  1497,  1498,  1500,  1501,  1502,  1503,  1504,
    1506,  1507,  1508,  1509,  1510,  1511,  1513,  1514,  1516,  1518,
    1519,  1520,  1521,  1523,  1524,  1526,  1529,  1530,  1531,  1532,
    1534,  1535,  1536,  1542,  1545,  1544,  1550,  1551,  1554,  1553,
    1556,  1558,  1559,  1562,  1563,  1565,  1574,  1583,  1589,  1582,
    1605,  1607,  1608,  1610,  1611,  1613,  1614,  1616,  1617,  1618,
    1619,  1620,  1621,  1622,  1624,  1625,  1626,  1627,  1633,  1634,
    1635,  1636,  1637,  1638,  1639,  1640,  1641,  1642,  1643,  1644,
    1645,  1646,  1647,  1648,  1649,  1650,  1651,  1652,  1654,  1656,
    1657,  1658,  1659,  1660,  1662,  1663,  1665,  1666,  1667,  1671,
    1670,  1683,  1682,  1694,  1695,  1696,  1697,  1699,  1698,  1707,
    1706,  1719,  1721,  1720,  1729,  1730,  1732,  1731,  1737,  1745,
    1746,  1747,  1750,  1751,  1752,  1754,  1759,  1760,  1761,  1762,
    1765,  1771,  1772,  1773,  1774,  1776,  1778,  1783,  1784,  1785,
    1787,  1788,  1789,  1790,  1791,  1792,  1795,  1796,  1797,  1798,
    1800,  1801,  1802,  1804,  1809,  1810,  1811,  1812,  1813,  1814,
    1820,  1821,  1822,  1823,  1824,  1826,  1827,  1829,  1834,  1835,
    1836,  1837,  1839,  1839,  1843,  1844,  1845,  1846,  1847,  1848,
    1849,  1851,  1861,  1862,  1864,  1868,  1869,  1870,  1872,  1876,
    1877,  1882,  1886,  1891,  1894,  1898,  1903,  1909,  1910,  1911,
    1913,  1915,  1916,  1918,  1919,  1922,  1923,  1924,  1927,  1928,
    1931,  1932,  1935,  1942,  1948,  1951,  1953,  1954,  1956,  1957,
    1961,  1962,  1964,  1969,  1974,  1979,  1984,  1994,  1995,  1997,
    1998,  1999,  2000,  2001,  2003,  2004,  2005,  2006,  2008,  2009,
    2011,  2012,  2013,  2015,  2016,  2018,  2024,  2026,  2026,  2032,
    2037,  2038,  2040,  2041,  2043,  2044,  2045,  2047,  2055,  2060,
    2062,  2067,  2072,  2074,  2075,  2077,  2079,  2080,  2081,  2083,
    2084,  2085,  2087,  2088,  2089,  2091,  2092,  2093,  2094,  2096,
    2097,  2099,  2100,  2102,  2103,  2104,  2105,  2106,  2108,  2109,
    2111,  2112,  2114,  2115,  2117,  2120,  2121,  2123,  2124,  2126,
    2128,  2131,  2132,  2133,  2135,  2136,  2137,  2139,  2140,  2142,
    2143,  2144,  2146,  2148,  2149,  2151,  2153,  2154,  2156,  2157,
    2159,  2161,  2171,  2182,  2183,  2186,  2187,  2188,  2190,  2191,
    2192,  2192,  2196,  2198,  2203,  2209,  2212,  2211,  2222,  2229,
    2230,  2231,  2233,  2234,  2235,  2238,  2239,  2241,  2242,  2244,
    2245,  2247,  2248,  2251,  2252,  2254,  2256
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "t_ABSTRLIST", "t_CHARLIST", "t_DIGIT",
  "t_STRING", "t_LETTER", "t_ACCESS", "t_AFTER", "t_ALIAS", "t_ALL",
  "t_AND", "t_ARCHITECTURE", "t_ARRAY", "t_ASSERT", "t_ATTRIBUTE",
  "t_BEGIN", "t_BLOCK", "t_BODY", "t_BUFFER", "t_BUS", "t_CASE",
  "t_COMPONENT", "t_CONFIGURATION", "t_CONSTANT", "t_DISCONNECT",
  "t_DOWNTO", "t_ELSE", "t_ELSIF", "t_END", "t_ENTITY", "t_EXIT", "t_FILE",
  "t_FOR", "t_FUNCTION", "t_GENERATE", "t_GENERIC", "t_GUARDED", "t_IF",
  "t_IN", "t_INOUT", "t_IS", "t_LABEL", "t_LIBRARY", "t_LINKAGE", "t_LOOP",
  "t_MAP", "t_NAND", "t_NEW", "t_NEXT", "t_NOR", "t_NULL", "t_OF", "t_ON",
  "t_OPEN", "t_OR", "t_OTHERS", "t_OUT", "t_PACKAGE", "t_PORT",
  "t_PROCEDURE", "t_PROCESS", "t_RANGE", "t_RECORD", "t_REGISTER",
  "t_REPORT", "t_RETURN", "t_SELECT", "t_SEVERITY", "t_SIGNAL",
  "t_SUBTYPE", "t_THEN", "t_TO", "t_TRANSPORT", "t_TYPE", "t_UNITS",
  "t_UNTIL", "t_USE", "t_VARIABLE", "t_WAIT", "t_WHEN", "t_WHILE",
  "t_WITH", "t_XOR", "t_IMPURE", "t_PURE", "t_GROUP", "t_POSTPONED",
  "t_SHARED", "t_XNOR", "t_SLL", "t_SRA", "t_SLA", "t_SRL", "t_ROR",
  "t_ROL", "t_UNAFFECTED", "t_ASSUME_GUARANTEE", "t_ASSUME", "t_CONTEXT",
  "t_COVER", "t_DEFAULT", "t_FAIRNESS", "t_FORCE", "t_INERTIAL",
  "t_LITERAL", "t_PARAMETER", "t_PROTECTED", "t_PROPERTY", "t_REJECT",
  "t_RELEASE", "t_RESTRICT", "t_RESTRICT_GUARANTEE", "t_SEQUENCE",
  "t_STRONG", "t_VMODE", "t_VPROP", "t_VUNIT", "t_SLSL", "t_SRSR", "t_QQ",
  "t_QGT", "t_QLT", "t_QG", "t_QL", "t_QEQU", "t_QNEQU", "t_GESym",
  "t_GTSym", "t_LESym", "t_LTSym", "t_NESym", "t_EQSym", "t_Ampersand",
  "t_Minus", "t_Plus", "MED_PRECEDENCE", "t_REM", "t_MOD", "t_Slash",
  "t_Star", "MAX_PRECEDENCE", "t_NOT", "t_ABS", "t_DoubleStar",
  "t_Apostrophe", "t_LeftParen", "t_RightParen", "t_Comma", "t_VarAsgn",
  "t_Colon", "t_Semicolon", "t_Arrow", "t_Box", "t_Bar", "t_Dot", "t_Q",
  "t_At", "t_Neg", "t_LEFTBR", "t_RIGHTBR", "t_ToolDir", "$accept",
  "start", "design_file", "design_unit_list", "designator", "literal",
  "enumeration_literal", "physical_literal", "physical_literal_1",
  "physical_literal_no_default", "idf_list", "design_unit", "context_list",
  "lib_unit", "context_item", "lib_clause", "use_clause", "sel_list",
  "entity_decl", "entity_start", "entity_decl_5", "entity_decl_4",
  "entity_decl_3", "entity_decl_6", "entity_decl_2", "@1", "entity_decl_1",
  "@2", "arch_body", "arch_start", "arch_body_2", "arch_body_1",
  "arch_body_3", "config_decl", "@3", "config_start", "config_decl_2",
  "config_decl_1", "config_decl_3", "package_decl", "package_start",
  "package_decl_2", "package_decl_1", "package_decl_3", "package_decl_22",
  "package_body", "pack_body_start", "package_body_2", "package_body_1",
  "package_body_3", "common_decltve_item_1", "common_decltve_item",
  "entity_decltve_item", "block_decltve_item", "block_declarative_part",
  "package_decltve_item", "package_body_decltve_item",
  "subprog_decltve_item", "procs_decltve_item", "config_decltve_item",
  "func_prec", "subprog_decl", "subprog_spec", "@4", "@5", "@6",
  "subprog_spec_22", "subprog_spec_33", "@7", "@8", "subprog_spec_2",
  "subprog_spec_1", "subprog_body", "@9", "subprog_body_2",
  "subprog_body_1", "subprog_body_3", "interf_list", "interf_list_1",
  "interf_list_2", "interf_element", "interf_element_4",
  "interf_element_3", "interf_element_2", "interf_element_1", "mode",
  "association_list", "association_list_1", "association_list_2",
  "gen_association_list", "gen_association_list_1",
  "gen_association_list_2", "association_element",
  "gen_association_element", "formal_part", "actual_part", "expr",
  "shift_op", "and_relation", "relation", "simple_exp", "adding_op",
  "term", "multiplying_operator", "factor", "primary", "name", "name2",
  "mark", "sel_name", "suffix", "ifts_name", "sigma", "attribute_name",
  "aggregate", "element_association_list2", "qualified_expr", "allocator",
  "allocator_2", "allocator_1", "element_association", "choices",
  "choices_1", "choices_2", "choice", "type_decl", "type_decl_1",
  "type_definition", "enumeration_type_definition",
  "enumeration_type_definition_1", "enumeration_type_definition_2",
  "physical_type_definition", "unit_stat", "physical_type_definition_1",
  "physical_type_definition_2", "base_unit_decl", "secondary_unit_decl",
  "unconstrained_array_definition", "unconstrained_array_definition_1",
  "unconstrained_array_definition_2", "index_subtype_definition",
  "constrained_array_definition", "record_type_simple_name",
  "record_type_definition", "record_type_definition_1",
  "record_type_definition_2", "element_decl", "access_type_definition",
  "file_type_definition", "subtype_decl", "subtype_indic",
  "subtype_indic_1", "subtype_indic1", "subtype_indic1_1",
  "range_constraint", "index_constraint", "index_constraint_1",
  "index_constraint_2", "discrete_range", "discrete_range1", "range_spec",
  "direction", "constant_decl", "constant_decl_1", "signal_decl",
  "signal_decl_2", "signal_decl_1", "variable_decl", "variable_decl_1",
  "object_class", "signal_kind", "alias_decl", "alias_name_stat",
  "alias_spec", "file_decl", "fi_dec", "file_decl_1", "disconnection_spec",
  "signal_list", "signal_list_1", "signal_list_2", "attribute_decl",
  "attribute_spec", "entity_spec", "entity_name_list",
  "entity_name_list_1", "entity_name_list_2", "entity_class",
  "if_generation_scheme", "if_scheme", "if_scheme_2", "if_scheme_1",
  "if_scheme_3", "generation_scheme", "iteration_scheme", "for_scheme",
  "while_scheme", "concurrent_stats", "concurrent_stats_1",
  "concurrent_stats_2", "concurrent_stat", "block_stat", "@10",
  "block_stat_5", "block_stat_4", "block_stat_6", "block_stat_3",
  "block_stat_7", "block_stat_2", "block_stat_8", "block_stat_1",
  "block_stat_0", "dot_name", "mark_comp", "comp_1", "vcomp_stat",
  "comp_inst_stat", "@11", "@12", "comp_inst_stat_1",
  "concurrent_assertion_stat", "concurrent_procedure_call",
  "concurrent_signal_assign_stat", "condal_signal_assign",
  "condal_wavefrms", "wavefrm", "wavefrm_1", "wavefrm_2",
  "wavefrm_element", "wavefrm_element_1", "wavefrm_element_2", "target",
  "opts", "opts_2", "opts_1", "sel_signal_assign", "sel_wavefrms",
  "sel_wavefrms_1", "sel_wavefrms_2", "gen_stat1",
  "generate_statement_body", "generate_stat", "@13", "opstat", "@14",
  "generate_stat_1", "end_stats", "procs_stat", "procs_stat1", "@15",
  "@16", "procs_stat1_3", "procs_stat1_5", "procs_stat1_6",
  "procs_stat1_2", "procs_stat1_4", "procs_stat1_1", "sensitivity_list",
  "sensitivity_list_1", "sensitivity_list_2", "seq_stats", "seq_stats_1",
  "seq_stats_2", "seq_stat", "report_statement", "assertion_stat",
  "assertion_stat_2", "assertion_stat_1", "choice_stat", "choice_stat_1",
  "case_stat", "@17", "@18", "case_stat_1", "case_stat_2",
  "case_stat_alternative", "@19", "if_stat", "@20", "if_stat_2", "@21",
  "if_stat_1", "if_stat_3", "@22", "loop_stat", "loop_stat_3",
  "loop_stat_2", "loop_stat_1", "exit_stat", "exit_stat_2", "exit_stat_1",
  "next_stat", "next_stat_2", "next_stat_1", "null_stat",
  "procedure_call_stat", "return_stat", "return_stat_1",
  "signal_assign_stat", "variable_assign_stat", "lable",
  "variable_assign_stat_1", "wait_stat", "wait_stat_3", "wait_stat_2",
  "wait_stat_1", "comp_end_dec", "iss", "comp_decl", "comp_decl_2",
  "comp_decl_1", "block_config", "@23", "block_config_2", "block_config_3",
  "block_config_1", "block_config_4", "block_spec", "config_item",
  "comp_config", "comp_config_2", "comp_config_1", "config_spec",
  "comp_spec_stat", "comp_spec", "inst_list", "binding_indic",
  "binding_indic_2", "binding_indic_1", "entity_aspect",
  "group_constituent", "group_constituent_list", "group_declaration",
  "group_template_declaration", "entity_class_entry", "tbox",
  "entity_class_entry_list", "group_name", "t_Identifier",
  "t_BitStringLit", "t_StringLit", "t_AbstractLit", "t_CharacterLit",
  "protected_type_declaration", "protected_stats", "protected_stat_decl_1",
  "protected_stat_1", "protected_type_declaration_item",
  "protected_type_body", "protected_body_stats",
  "protected_body_stat_decl_1", "protected_body_stat_1",
  "protected_type_body_declaration_item", "context_ref", "context_decl",
  "@24", "context_stat_1", "libustcont_stats", "libustcont_stat",
  "package_instantiation_decl", "subprogram_instantiation_decl",
  "signature", "signature1", "mark_stats", "mark_stats_1", "case_scheme",
  "when_stats_1", "when_stats", "ttend", "conditional_signal_assignment",
  "conditional_waveform_assignment", "else_wave_list",
  "conditional_force_assignment", "selected_signal_assignment",
  "selected_waveform_assignment", "delay_stat", "sel_wave_list",
  "sel_wave_list_1", "selected_force_assignment", "inout_stat",
  "delay_mechanism", "conditional_variable_assignment", "else_stat",
  "selected_variable_assignment", "sel_var_list", "sel_var_list_1",
  "select_name", "interface_subprogram_decl", "iproc", "ifunc",
  "func_name", "return_is", "param", "@25", "interface_package_decl",
  "gen_assoc_list", "gen_interface_list", "@26", "external_name",
  "sig_stat", "external_pathname", "absolute_pathname",
  "relative_pathname", "neg_list", "pathname_element",
  "pathname_element_list", "package_path_name", "tool_directive", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302,   303,   304,
     305,   306,   307,   308,   309,   310,   311,   312,   313,   314,
     315,   316,   317,   318,   319,   320,   321,   322,   323,   324,
     325,   326,   327,   328,   329,   330,   331,   332,   333,   334,
     335,   336,   337,   338,   339,   340,   341,   342,   343,   344,
     345,   346,   347,   348,   349,   350,   351,   352,   353,   354,
     355,   356,   357,   358,   359,   360,   361,   362,   363,   364,
     365,   366,   367,   368,   369,   370,   371,   372,   373,   374,
     375,   376,   377,   378,   379,   380,   381,   382,   383,   384,
     385,   386,   387,   388,   389,   390,   391,   392,   393,   394,
     395,   396,   397,   398,   399,   400,   401,   402,   403,   404,
     405,   406,   407,   408,   409,   410,   411,   412,   413,   414,
     415,   416,   417
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint16 yyr1[] =
{
       0,   163,   164,   165,   165,   165,   166,   166,   167,   167,
     168,   168,   168,   168,   168,   169,   169,   170,   171,   171,
     172,   173,   173,   174,   175,   175,   176,   176,   176,   176,
     176,   176,   176,   177,   177,   178,   179,   180,   180,   181,
     181,   182,   183,   183,   184,   184,   185,   185,   186,   187,
     188,   187,   189,   190,   189,   189,   191,   191,   192,   193,
     193,   193,   193,   194,   194,   195,   196,   197,   196,   198,
     199,   199,   199,   199,   200,   200,   201,   202,   202,   203,
     204,   204,   204,   204,   205,   205,   205,   206,   207,   207,
     207,   207,   208,   208,   209,   210,   210,   210,   210,   211,
     211,   212,   213,   213,   213,   213,   214,   214,   214,   214,
     214,   214,   214,   215,   215,   215,   215,   215,   215,   215,
     215,   215,   215,   216,   216,   216,   216,   216,   216,   216,
     216,   216,   216,   216,   216,   216,   217,   217,   218,   218,
     218,   218,   218,   218,   218,   218,   218,   218,   218,   218,
     219,   219,   219,   219,   219,   219,   219,   219,   220,   220,
     220,   220,   220,   220,   220,   220,   221,   222,   222,   222,
     222,   223,   223,   224,   226,   225,   227,   225,   228,   225,
     229,   229,   231,   230,   232,   230,   233,   233,   233,   233,
     234,   236,   235,   235,   237,   237,   237,   237,   237,   237,
     237,   238,   238,   239,   240,   240,   241,   241,   242,   243,
     243,   243,   243,   244,   244,   245,   245,   245,   246,   246,
     247,   247,   248,   248,   248,   248,   248,   249,   250,   250,
     251,   252,   252,   252,   253,   253,   254,   255,   255,   255,
     255,   256,   256,   256,   257,   258,   258,   258,   259,   259,
     260,   260,   260,   260,   260,   260,   261,   261,   261,   261,
     261,   261,   261,   261,   261,   261,   261,   261,   261,   262,
     262,   262,   262,   262,   262,   262,   262,   262,   262,   262,
     262,   262,   262,   262,   262,   262,   262,   262,   262,   262,
     262,   262,   262,   262,   262,   262,   263,   263,   263,   263,
     264,   264,   264,   265,   265,   266,   266,   266,   266,   267,
     267,   267,   267,   268,   268,   268,   268,   268,   268,   269,
     269,   269,   270,   270,   270,   271,   271,   272,   273,   273,
     273,   274,   274,   275,   276,   276,   276,   276,   276,   277,
     277,   278,   278,   279,   279,   280,   280,   280,   281,   281,
     282,   282,   283,   283,   284,   285,   285,   286,   287,   287,
     287,   288,   288,   288,   289,   289,   290,   290,   290,   290,
     290,   290,   290,   290,   290,   290,   291,   292,   292,   293,
     294,   295,   295,   296,   296,   297,   298,   299,   300,   301,
     301,   302,   303,   304,   305,   305,   306,   307,   307,   308,
     309,   310,   311,   312,   312,   313,   313,   314,   314,   315,
     315,   315,   316,   316,   317,   318,   319,   319,   320,   321,
     321,   322,   322,   323,   323,   324,   324,   325,   326,   326,
     327,   328,   328,   329,   329,   330,   330,   331,   331,   332,
     332,   332,   332,   332,   332,   333,   333,   334,   334,   335,
     335,   336,   336,   337,   337,   338,   338,   339,   339,   340,
     341,   341,   341,   342,   342,   343,   344,   345,   346,   347,
     347,   347,   348,   348,   349,   350,   350,   350,   350,   350,
     350,   350,   350,   350,   350,   350,   350,   350,   350,   350,
     350,   350,   350,   350,   351,   352,   352,   353,   353,   353,
     354,   354,   355,   355,   356,   357,   357,   358,   358,   359,
     360,   361,   361,   362,   363,   363,   363,   363,   363,   363,
     363,   365,   364,   366,   366,   367,   367,   368,   369,   369,
     370,   371,   371,   372,   372,   373,   373,   374,   374,   375,
     375,   376,   376,   377,   378,   378,   378,   380,   379,   381,
     379,   379,   379,   382,   382,   383,   383,   383,   383,   384,
     384,   384,   384,   385,   385,   385,   385,   385,   385,   385,
     385,   386,   387,   387,   387,   388,   388,   389,   389,   390,
     391,   392,   392,   392,   392,   393,   394,   394,   395,   396,
     396,   396,   396,   397,   397,   398,   399,   400,   400,   401,
     402,   402,   402,   403,   405,   404,   406,   406,   407,   404,
     404,   408,   408,   409,   409,   410,   410,   412,   413,   411,
     411,   414,   414,   415,   415,   416,   416,   417,   417,   417,
     418,   419,   419,   419,   420,   421,   421,   422,   423,   424,
     424,   425,   426,   426,   426,   426,   426,   426,   426,   426,
     426,   426,   426,   426,   426,   426,   426,   426,   427,   428,
     429,   429,   430,   430,   431,   431,   432,   432,   432,   434,
     433,   435,   433,   433,   436,   436,   437,   439,   438,   441,
     440,   442,   443,   442,   444,   444,   446,   445,   447,   448,
     448,   449,   449,   450,   450,   451,   452,   452,   453,   453,
     454,   455,   455,   456,   456,   457,   458,   459,   460,   460,
     461,   461,   461,   461,   461,   461,   462,   462,   462,   462,
     463,   464,   464,   465,   466,   466,   467,   467,   468,   468,
     469,   469,   469,   469,   469,   470,   470,   471,   472,   472,
     473,   473,   475,   474,   474,   476,   476,   477,   478,   478,
     479,   480,   481,   481,   482,   483,   483,   484,   484,   484,
     484,   485,   485,   486,   486,   486,   487,   488,   488,   488,
     489,   490,   490,   491,   491,   492,   492,   492,   493,   493,
     494,   494,   495,   496,   496,   497,   498,   498,   499,   499,
     500,   500,   501,   502,   503,   504,   505,   506,   506,   507,
     507,   508,   509,   509,   510,   510,   510,   510,   511,   511,
     512,   512,   513,   514,   514,   515,   516,   518,   517,   517,
     519,   519,   520,   520,   521,   521,   521,   522,   522,   522,
     523,   523,   523,   524,   524,   524,   525,   525,   525,   526,
     526,   527,   528,   528,   528,   529,   529,   530,   530,   531,
     531,   532,   532,   533,   533,   533,   533,   533,   534,   534,
     535,   535,   536,   536,   537,   538,   538,   539,   539,   540,
     541,   542,   542,   542,   543,   543,   543,   544,   544,   545,
     545,   545,   546,   547,   547,   548,   549,   549,   550,   550,
     551,   552,   552,   553,   553,   554,   554,   554,   555,   555,
     556,   555,   555,   557,   557,   558,   560,   559,   561,   562,
     562,   562,   563,   563,   563,   564,   564,   565,   565,   566,
     566,   567,   567,   568,   568,   569,   570
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     1,     1,     1,     1,     2,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     2,     0,     1,
       2,     1,     3,     2,     0,     2,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     3,     3,     1,     3,     4,
       7,     3,     0,     1,     0,     2,     0,     2,     1,     0,
       0,     4,     0,     0,     4,     3,     7,     5,     5,     0,
       1,     2,     1,     0,     2,     1,     5,     0,     7,     5,
       0,     1,     1,     2,     0,     2,     1,     5,     5,     3,
       0,     1,     2,     1,     0,     1,     2,     1,     2,     1,
       2,     3,     5,     5,     4,     0,     1,     2,     3,     0,
       2,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     2,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       4,     1,     1,     2,     0,     4,     0,     7,     0,     6,
       1,     2,     0,     3,     0,     2,     0,     2,     1,     1,
       1,     0,     9,     6,     0,     1,     1,     1,     2,     2,
       2,     0,     2,     1,     4,     3,     0,     2,     2,     1,
       1,     2,     7,     0,     2,     0,     1,     1,     0,     1,
       0,     1,     1,     1,     1,     1,     1,     4,     0,     2,
       2,     4,     3,     3,     0,     2,     2,     3,     1,     1,
       1,     1,     3,     1,     1,     1,     1,     2,     1,     1,
       1,     1,     1,     1,     1,     1,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     2,
       1,     2,     2,     2,     2,     3,     4,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     2,     2,     1,     3,
       1,     1,     1,     1,     3,     1,     1,     1,     1,     1,
       2,     2,     3,     1,     1,     1,     1,     1,     3,     1,
       1,     1,     1,     1,     1,     1,     1,     3,     1,     1,
       1,     2,     2,     1,     3,     4,     3,     3,     3,     2,
       5,     4,     3,     5,     3,     4,     3,     2,     0,     1,
       0,     1,     3,     1,     2,     0,     2,     2,     1,     1,
       1,     4,     4,     3,     0,     2,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     4,     0,     2,     2,
       6,     2,     1,     0,     2,     1,     2,     4,     7,     0,
       2,     2,     3,     4,     0,     1,     6,     0,     2,     1,
       4,     2,     3,     5,     3,     2,     1,     0,     1,     3,
       2,     3,     0,     1,     2,     4,     0,     2,     2,     1,
       1,     1,     3,     1,     3,     1,     1,     6,     0,     2,
       7,     0,     2,     0,     1,     6,     7,     0,     2,     1,
       1,     1,     2,     1,     1,     1,     1,     7,     6,     1,
       1,     0,     2,     8,     6,     0,     4,     0,     1,     7,
       2,     1,     1,     0,     2,     2,     5,     7,     4,     2,
       1,     1,     0,     2,     2,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     6,     7,     0,     3,     4,
       0,     2,     4,     5,     1,     1,     1,     4,     5,     2,
       1,     0,     2,     1,     1,     1,     1,     1,     1,     1,
       1,     0,    15,     0,     1,     0,     2,     1,     0,     4,
       4,     0,     4,     0,     4,     0,     4,     0,     1,     1,
       3,     2,     1,     3,     1,     1,     1,     0,     9,     0,
       8,     8,     9,     0,     3,     3,     1,     4,     2,     3,
       1,     4,     2,     3,     1,     4,     2,     4,     2,     3,
       1,     5,     1,     3,     5,     2,     1,     0,     2,     2,
       2,     0,     2,     2,     1,     2,     1,     1,     2,     0,
       1,     3,     1,     0,     1,     8,     4,     0,     2,     4,
       0,     2,     1,     2,     0,     8,     4,     3,     0,     5,
       3,     1,     2,     2,     3,     3,     1,     0,     0,    11,
       4,     0,     3,     0,     1,     0,     1,     0,     1,     2,
       1,     0,     3,     3,     2,     0,     2,     2,     1,     0,
       2,     1,     1,     2,     1,     1,     1,     1,     1,     1,
       1,     1,     2,     1,     1,     1,     2,     1,     5,     5,
       0,     2,     0,     2,     0,     1,     0,     1,     1,     0,
      11,     0,    12,     6,     0,     2,     1,     0,     5,     0,
      10,     0,     0,     3,     0,     2,     0,     5,     8,     0,
       1,     0,     1,     0,     2,     5,     0,     2,     0,     1,
       5,     0,     2,     0,     1,     2,     2,     3,     0,     1,
       4,     5,     6,     5,     1,     1,     2,     1,     2,     1,
       2,     3,     4,     5,     0,     2,     0,     2,     0,     2,
       1,     3,     3,     3,     2,     0,     1,     7,     0,     3,
       0,     3,     0,     8,     5,     0,     2,     1,     0,     2,
       1,     1,     1,     1,     7,     0,     1,     0,     3,     4,
       3,     4,     7,     2,     4,     2,     3,     1,     1,     1,
       3,     0,     3,     0,     3,     2,     2,     1,     1,     1,
       1,     3,     8,     7,     7,     2,     0,     1,     1,     3,
       1,     1,     1,     1,     1,     1,     1,     4,     4,     0,
       2,     1,     1,     2,     1,     1,     1,     1,     5,     5,
       0,     2,     1,     2,     3,     1,     3,     0,     8,     6,
       1,     2,     1,     2,     1,     1,     1,     7,     8,     6,
       7,     8,     6,     0,     3,     2,     2,     1,     3,     1,
       2,     2,     9,     8,     8,     5,     4,     2,     1,     2,
       3,     1,     1,     7,     8,     6,     7,     4,     4,     2,
       9,     8,     1,     1,     8,     0,     1,     5,     1,     4,
       9,     0,     1,     1,     1,     3,     1,     5,     4,     4,
       5,     2,     7,     5,     1,     4,     1,     1,     1,     1,
       3,     6,     7,     1,     1,     0,     2,     2,     0,     1,
       0,     6,     4,     5,     6,     3,     0,     3,     6,     1,
       1,     1,     1,     1,     1,     3,     2,     3,     2,     2,
       3,     1,     4,     2,     3,     2,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,     0,   792,     0,     0,   172,   171,   624,     0,     2,
      24,     6,     0,     0,     0,     5,     4,   616,   617,     0,
     621,   794,   178,     8,     9,   174,     1,     7,     0,     0,
       0,     0,     0,     0,     0,    23,    25,    33,    34,    26,
       0,    29,     0,    27,     0,    28,     0,    30,     0,    31,
      32,     0,     0,     0,     0,     0,     0,   184,   186,     0,
       0,     0,     0,    21,     0,     0,     0,     0,     0,     0,
     320,   319,   326,   324,   323,   325,   322,   321,     0,     0,
       0,    49,     0,     0,     0,     0,     0,   906,     0,    85,
      89,     0,     0,   176,     0,   191,   631,   615,   620,   625,
     182,   189,   188,     0,     0,   180,   190,   175,     0,     0,
      41,     0,    35,     0,     0,    79,   909,   910,   911,     0,
       0,    36,     0,   333,     0,   332,     0,   331,     0,     0,
     817,   730,     0,     0,     0,    50,    46,    59,     0,     0,
     511,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   926,   112,    64,   102,   104,   134,   123,
      65,   111,     0,   124,   106,   107,   108,   130,   131,   110,
     109,   129,   126,   127,   125,   128,   133,   132,   103,   105,
     135,    70,     0,     0,     0,     0,   168,    75,    76,   167,
       0,   169,    80,     0,    80,     0,   147,    86,   138,    87,
       0,   143,   144,   142,   140,   141,   139,   146,   145,   148,
     149,     0,    88,    90,    95,    95,   100,   157,   150,   101,
     151,   152,   155,   156,   154,   153,   184,   194,   165,   158,
     203,   159,     0,   202,   162,   160,   161,   164,   163,     0,
     627,   622,   626,     0,   187,     0,   185,     0,   181,     0,
       0,    22,     0,    94,     0,     0,     0,     0,     0,   912,
     913,     0,   914,   326,   796,   330,   328,   327,   329,     0,
     795,   793,     0,    14,     0,   360,     0,     0,     0,     0,
       0,     0,   314,    13,   234,   241,   248,   249,   270,   313,
     319,   326,   315,     0,   316,   317,     0,   421,   243,    12,
      10,    11,   338,   336,   337,   334,     0,   319,     0,     0,
      42,    42,    42,   734,    39,    55,     0,     0,    44,    62,
       0,    60,   451,   449,   450,     0,     0,     0,   735,     0,
     462,   461,   463,     0,     0,   768,   769,   767,   773,     0,
       8,     0,     0,     0,     0,     0,     0,     0,     0,   173,
      72,     0,    71,     0,     0,   751,   748,     0,     0,    70,
      83,     0,    81,   907,     0,     0,    91,     0,     0,    96,
       0,     0,   196,   197,   195,     0,   639,     0,   635,     0,
     628,   618,   183,     0,   439,   443,     0,     0,     0,   440,
     444,   441,     0,     0,   206,     0,   221,   210,   888,   889,
     209,   179,    58,    69,     0,   833,   539,   916,     0,     0,
     925,   919,     0,     0,   918,     0,   232,   348,   347,   233,
     269,   272,   271,   274,   273,   358,     0,     0,   355,   359,
       0,   426,   425,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   250,   251,   252,   253,
     254,   255,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   333,   412,   410,   339,     0,     0,
      20,   335,   820,     0,     0,   825,   824,   826,     0,   822,
     732,    43,   731,   733,    54,     0,   511,     0,    47,   122,
     113,    48,   114,   118,   119,   117,   115,   116,   121,   120,
      61,    57,     0,     0,     0,     0,    59,     0,     0,   624,
       0,   586,   587,   512,   513,   514,   518,   515,   516,   517,
     564,     0,   570,   519,   520,   556,   560,   325,   736,   740,
       0,   460,     0,     0,     0,     0,     0,   771,     0,     0,
       0,   404,     0,   363,     0,     0,     0,     0,     0,     0,
       0,    73,    66,     0,   745,     0,     0,    82,    77,    78,
       0,   905,    97,    92,    93,     0,   200,   199,   198,   193,
       0,   693,   632,   634,   633,   166,   630,     0,   629,   205,
     893,   894,   898,     0,   898,   442,     0,     0,     0,    21,
     829,     0,     0,     0,     0,   923,   915,     0,   407,     0,
     406,   920,   917,   349,   350,   346,     0,   318,     0,     0,
     354,   231,     0,   235,   422,   266,   263,   264,   267,   268,
     265,   257,   262,   260,   259,   258,   261,   295,   294,   293,
     292,   291,   290,   284,   286,   283,   285,   288,   287,   279,
     282,   281,   278,   277,   289,   280,   256,   275,     0,     0,
       0,     0,     0,   298,   303,   309,   423,   414,     0,   344,
     413,   411,   409,   353,   342,     0,   242,   821,   819,     0,
       0,   823,    51,    45,     0,   452,     0,   471,   470,   472,
       0,   833,   319,     0,   662,     0,   566,   568,   558,   562,
     706,   593,     0,     0,   738,   428,     0,   464,   319,     0,
     325,     0,     0,     0,   777,     0,   763,   773,   761,     0,
     765,   766,     0,   433,     0,   361,     0,     0,     0,     0,
       0,     0,   365,   366,   368,   369,   370,   371,   372,   373,
     367,   374,   375,   362,   437,     0,     0,   790,   791,     0,
       0,   750,   742,   749,   170,    67,   246,   240,     0,   239,
     228,     0,   238,   245,   313,    98,   177,   194,     0,     0,
       0,   708,   728,     0,     0,   640,   641,   657,   642,   644,
     646,   647,   691,   645,   648,   649,   650,   651,   653,   654,
       0,     0,   655,   325,   715,   851,   852,   714,   862,   863,
     717,   719,     0,   636,   639,   899,   220,     0,     0,   890,
     898,   204,   220,   207,   218,   540,     0,   835,   839,     0,
     837,   827,     0,     0,   924,   331,   405,   908,   351,   345,
     276,   341,   352,     0,   356,   236,   296,   297,   311,   310,
     300,   301,   302,     0,     0,   306,   307,   308,   305,     0,
       0,   358,     0,   816,     0,    40,     0,   833,   469,     0,
       0,   466,    56,     0,   660,     0,   594,     0,   589,   521,
       0,   546,   544,   545,   624,   547,     0,   563,   569,     0,
       0,   555,   559,   610,     0,     0,     0,     0,     0,   465,
       0,   457,     0,     0,   774,   776,   775,     0,   771,     0,
       0,     0,   833,   445,   446,   431,   434,   403,   401,     0,
       0,     0,     0,   397,     0,     0,     0,   377,    16,    15,
       0,     0,     0,     0,   476,   479,   478,   487,   475,   489,
     484,   480,   477,   483,   485,   482,   481,   490,   486,   488,
     491,   493,   492,   786,   788,     0,     0,   437,   744,     0,
     752,     0,   746,   747,   753,    68,   247,     0,     0,     0,
       0,   665,     0,     0,   705,   709,     0,     0,   726,     0,
       0,     0,   698,     0,   703,     0,     0,   692,   505,   506,
       0,   664,   586,     0,   643,   652,   656,   718,     0,   716,
     720,   637,     0,     0,   206,     0,     0,     0,   208,   225,
     222,   224,   226,   223,     0,   219,   319,   834,     0,     0,
     840,   828,   922,   340,   358,   357,   299,   424,   304,   312,
     343,   352,   818,   448,     0,     0,   473,     0,     0,   663,
       0,     0,     0,   576,   581,     0,   572,   577,   590,   592,
       0,   588,   537,     0,     0,   565,   567,   557,   561,     0,
       0,   542,     0,     0,   504,     0,     0,   494,   741,     0,
       0,   429,   427,     0,   458,     0,     0,   454,   764,   770,
       0,   772,   832,     0,     0,     0,   319,   389,   419,   416,
     420,     0,   319,     0,     0,     0,     0,     0,     0,   804,
     806,   805,   800,   801,   807,     0,   383,     0,   438,   435,
       0,   787,   785,     0,     0,   780,     0,   778,   779,     0,
     757,   325,     0,   227,     0,   229,   237,   192,     0,   669,
     679,   707,   729,     0,   724,   664,     0,   874,   871,   876,
       0,   871,     0,   577,     0,   721,   696,   699,     0,     0,
     701,   704,   660,   509,   639,     0,     0,     0,   621,   220,
       0,   895,   903,     0,   215,   319,   841,   447,   474,   467,
     468,   661,   659,   593,     0,   584,   580,   571,     0,   575,
       0,   538,   535,     0,     0,     0,     0,     0,   541,     0,
       0,   600,     0,     0,   325,     0,   609,     0,   739,   737,
     459,     0,     0,   762,   830,     0,   432,   430,     0,     0,
       0,   393,     0,     0,   398,   399,   802,   798,     0,     0,
     815,   811,   812,   797,   376,     0,   378,     0,   386,   784,
     783,   789,     0,     0,   436,     0,   755,   771,     0,   230,
     666,     0,   639,   727,     0,     0,     0,   857,   872,   873,
       0,     0,     0,   710,     0,     0,   577,     0,     0,     0,
       0,   720,     0,     0,     0,     0,   671,   722,     0,   878,
       0,     0,   206,   902,     0,   891,   904,   895,   216,   217,
     213,   597,   582,     0,   583,   573,     0,   578,   591,     0,
     531,     0,     0,   848,     0,     0,     0,     0,     0,     0,
     602,   136,     0,   511,   600,     0,   611,   613,     0,     0,
       0,   453,   456,   831,   392,     0,     0,   390,   415,     0,
     417,   400,   394,   803,     0,   809,   808,   379,     0,   384,
     385,     0,   782,   781,     0,     0,   756,     0,     0,   743,
     667,     0,   668,     0,   684,   725,   723,   586,   587,     0,
       0,     0,   875,   713,     0,   711,     0,   697,   695,     0,
     319,   507,   702,   700,   658,     0,     0,   881,     0,   877,
     619,     0,   897,   896,   892,     0,   212,     0,     0,   585,
       0,   579,     0,     0,   528,     0,     0,     0,     0,   847,
       0,   553,     0,   543,   553,     0,   601,   137,     0,   511,
     500,   600,   612,   607,   614,     0,     0,   319,   391,   418,
     396,   395,   813,   382,   380,    18,     0,   760,     0,   758,
     673,     0,   674,   681,   865,     0,     0,   712,     0,   855,
       0,     0,   508,   689,     0,     0,     0,   901,   214,   595,
       0,   598,   574,   537,     0,     0,   525,     0,   600,     0,
       0,   849,     0,     0,     0,     0,   550,     0,   551,   605,
     603,   497,   500,   606,   388,     0,   814,   381,     0,     0,
      19,   759,     0,     0,     0,   682,     0,     0,   685,   871,
       0,   866,     0,   882,   884,     0,   859,   853,   856,     0,
       0,   690,   674,   879,     0,     0,   536,   533,     0,     0,
       0,   846,   600,     0,   850,     0,     0,   548,   552,     0,
       0,   495,   501,   497,   387,    17,   754,   677,     0,   675,
     676,   639,     0,     0,     0,     0,   864,   868,     0,   861,
       0,     0,   854,   688,     0,   880,   596,     0,   532,     0,
     511,   527,   526,   844,   845,   843,     0,   554,   600,     0,
       0,     0,     0,   496,   639,   666,   683,   686,     0,   870,
       0,     0,   860,   858,     0,   599,     0,     0,   529,     0,
     842,   498,   600,   600,     0,   678,     0,   639,   680,     0,
       0,   885,   666,     0,     0,     0,   499,   502,   600,   670,
     687,     0,   869,   883,     0,   534,     0,   523,   503,   867,
     672,   530,     0,   524,   522
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     8,     9,    10,    22,   282,   917,  1458,  1459,   283,
     337,    11,    12,    35,    36,   485,   154,    68,    39,    40,
     490,   497,   318,   498,   136,   317,    81,   134,    41,    42,
     320,    83,   155,    43,   955,    44,   351,    85,   187,   156,
      46,   361,    88,   197,    89,   157,    48,   368,    92,   216,
     158,   159,   501,  1291,  1292,   199,   219,   230,   586,   188,
      13,   161,   162,    58,   226,    57,   101,   102,   243,   103,
     104,   107,   163,   232,   375,    95,   233,   246,   597,   813,
     394,  1366,  1270,  1004,   395,  1005,   571,   957,  1115,   127,
     430,   623,   760,   284,   761,   762,  1034,   471,   286,   287,
     662,   843,   663,   849,   664,   288,   289,    70,   307,   291,
     267,    73,   128,    74,   292,   293,   294,   295,   615,   829,
     426,   427,   620,   834,   428,   164,   556,   732,   733,  1095,
    1216,   734,  1404,  1217,  1319,  1096,  1320,   735,  1199,  1307,
    1077,   736,  1400,   737,  1084,  1204,   913,   738,   739,   165,
    1078,   826,   610,   671,   476,   910,  1200,  1310,  1079,   429,
    1080,   433,   166,   888,   167,  1075,   905,   168,   922,   396,
     906,   169,   322,   513,   170,   893,  1065,   171,   333,   541,
     707,   172,   173,   690,   691,   858,  1026,   943,  1056,  1057,
    1501,  1451,  1502,  1053,   977,   978,   979,   326,   327,   523,
     524,   525,  1042,  1592,  1489,  1532,  1436,  1558,  1374,  1528,
    1280,  1172,   405,  1052,  1178,   876,   526,  1049,  1050,  1445,
     527,   528,   529,   530,  1035,  1036,  1169,  1277,  1037,  1166,
    1274,   531,   867,  1041,   868,   532,  1367,  1368,  1431,  1389,
    1390,   533,   879,  1186,   880,  1298,  1187,    16,    17,    53,
     587,    55,    18,   241,   381,   588,   240,   379,   583,   803,
     580,   581,   775,   776,   777,   535,  1031,   864,   962,  1331,
     779,  1231,  1356,  1464,  1509,  1510,  1544,   780,  1232,  1467,
    1511,  1413,  1468,  1567,   781,  1480,   980,   782,   783,  1248,
    1136,   784,  1253,  1140,   785,   536,   787,   966,   788,   789,
     790,   791,   792,  1235,  1124,   968,   132,   539,   174,   886,
     704,   190,   951,   752,   952,   564,   753,   356,   953,   954,
    1327,  1226,   175,   546,   338,   339,   716,   720,   547,   717,
    1105,  1106,   176,   177,   944,  1102,   945,   746,    75,   299,
      76,   300,   301,   741,   916,  1092,  1207,  1093,   742,  1087,
    1211,  1315,  1212,   487,    49,   309,   483,   488,   489,   178,
     179,   603,   819,   820,  1010,   883,  1283,  1284,  1380,   794,
     795,  1420,   796,   797,   798,  1470,  1516,  1517,   799,  1240,
    1134,   800,  1260,   801,  1473,  1474,  1340,   397,   398,   399,
     592,  1265,   807,   993,   400,   213,   105,   193,    77,   119,
     258,   259,   260,   261,   408,   409,   262,   180
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -1214
static const yytype_int16 yypact[] =
{
    2249,   113, -1214,   891,   164, -1214, -1214, -1214,   179, -1214,
     344, -1214,   627,   162,   362, -1214, -1214, -1214, -1214,   285,
     103, -1214, -1214, -1214, -1214, -1214, -1214, -1214,   164,   164,
     164,   164,   648,   310,   164, -1214, -1214, -1214, -1214, -1214,
    2287, -1214,  1409, -1214,   566, -1214,  2354, -1214,  2387, -1214,
   -1214,   891,  2420,   379,   351,   311,   447,   268,   176,   489,
     537,   563,   197, -1214,   164,   164,   641,   490,   505,   544,
     728,   728,   539, -1214,   560, -1214, -1214, -1214,   722,   736,
     122,   716,   762,  1541,   793,   609,   800, -1214,  2525, -1214,
      76,   814,  2615, -1214,   824,  2650,   650, -1214, -1214,   164,
   -1214,   431, -1214,   738,   854,   889, -1214, -1214,   164,   164,
   -1214,   164, -1214,   849,   912,   884, -1214, -1214, -1214,   766,
     310, -1214,   780, -1214,  1245, -1214,   335, -1214,   389,  1918,
     937,   835,   819,   823,   738, -1214, -1214,   180,   891,   164,
   -1214,   164,   164,   513,   164,   615,   891,   164,   694,   767,
     164,   164,   903, -1214, -1214, -1214, -1214, -1214, -1214, -1214,
   -1214, -1214,   174, -1214, -1214, -1214, -1214, -1214, -1214, -1214,
   -1214, -1214, -1214, -1214, -1214, -1214, -1214, -1214, -1214, -1214,
   -1214,   527,   164,   202,   500,   164, -1214, -1214, -1214, -1214,
     956, -1214,   213,   738,   213,   792, -1214, -1214, -1214, -1214,
     837, -1214, -1214, -1214, -1214, -1214, -1214, -1214, -1214, -1214,
   -1214,   975, -1214,   887,   496,   496, -1214, -1214, -1214, -1214,
   -1214, -1214, -1214, -1214, -1214, -1214,   268,   719, -1214, -1214,
   -1214, -1214,  1015, -1214, -1214, -1214, -1214, -1214, -1214,   360,
     994, -1214, -1214,   738, -1214,  2486, -1214,   310, -1214,  1002,
    1004, -1214,   999, -1214,   164,   164,   164,   911,   918, -1214,
   -1214,    79, -1214,   629, -1214, -1214, -1214, -1214, -1214,   928,
   -1214, -1214,   310, -1214,   944, -1214,   480,   480,   480,   480,
     480,  1899, -1214, -1214, -1214,    87,   761,  2024,   948,   544,
     394, -1214, -1214,   764, -1214, -1214,   941, -1214,   942, -1214,
     164, -1214, -1214, -1214, -1214, -1214,   950,   847,   996,   495,
     164,   164,   164, -1214, -1214, -1214,   947,   738,  2557,   164,
     952, -1214,   949, -1214, -1214,   315,  1072,  1864,  1063,   608,
   -1214, -1214,   544,   955,   812, -1214, -1214,   958,   520,   957,
    1069,   841,   960,  1076,   962,   111,   858,   141,   164, -1214,
     164,   967, -1214,  1067,  1091,   544, -1214,   164,   971,   527,
     164,   972, -1214, -1214,   973,   976, -1214,  1107,   977, -1214,
     980,  1060,   992,   164, -1214,   981, -1214,   986,   544,   988,
   -1214,  2650, -1214,   989, -1214, -1214,   891,   164,   164, -1214,
   -1214, -1214,  1049,  1104, -1214,   164, -1214, -1214, -1214, -1214,
   -1214,   700, -1214, -1214,   991,   218, -1214,   477,   985,   164,
     993, -1214,   310,   998,   477,   164, -1214,    86, -1214, -1214,
   -1214,   995, -1214, -1214, -1214,   529,  1001,  1003, -1214, -1214,
     862, -1214, -1214,  1918,  1918,  1918,  1918,  1918,  1918,  1918,
    1918,  1918,  1918,  1918,  1918,  1918, -1214, -1214, -1214, -1214,
   -1214, -1214,  1918,  1918,  1918,  1918,  1918,  1918,  1918,  1918,
    1918,  1918,  1918,  1918,  1918,  1918,  1918,  1918,  1918,  1918,
    1918,  1918,   480,  1366,   997,   313, -1214, -1214,  1899,  1918,
   -1214, -1214,   164,  1000,   310, -1214, -1214, -1214,   711, -1214,
   -1214, -1214, -1214, -1214, -1214,  1007, -1214,   736, -1214, -1214,
   -1214, -1214, -1214, -1214, -1214, -1214, -1214, -1214, -1214, -1214,
   -1214, -1214,   310,  1103,   628,   310,   180,  1918,  1918,   323,
    1899,   514, -1214, -1214, -1214, -1214, -1214, -1214, -1214, -1214,
   -1214,  1018, -1214, -1214, -1214, -1214, -1214,  1009, -1214,  1118,
     310,  1012,   310,   310,  1115,   592,  1011,  1105,  1918,  1117,
     310, -1214,   310, -1214,  1016,   484,  1017,   310,  1020,   891,
     868, -1214, -1214,  1130,  1094,   712,  1022, -1214, -1214, -1214,
    1185, -1214,   164, -1214, -1214,   310, -1214, -1214, -1214, -1214,
    1146,  1993, -1214,  1029, -1214, -1214, -1214,  1164, -1214, -1214,
   -1214, -1214,   438,  1140,   438, -1214,   891,   571,   872,   732,
   -1214,   164,   157,   118,  1918, -1214,   477,  1027,   302,  1064,
   -1214, -1214,   477,   713,   700, -1214,   480, -1214,  1899,  1918,
    1031, -1214,  1899, -1214, -1214,  1966,  1966,  1966,  1966,  1966,
    1966,  1966,  1966,  1966,  1966,  1966,  1966,  2656,  2656,  2656,
    2656,  2656,  2656,  2656,  2656,  2656,  2656,  2656,  2656,   865,
     865,   865, -1214, -1214, -1214, -1214,  1966, -1214,   378,   378,
     480,   480,   427, -1214,   922,  1048,  1840, -1214,  1899, -1214,
     713, -1214, -1214,    88, -1214,  1043, -1214, -1214, -1214,   757,
     996, -1214, -1214, -1214,  1046, -1214,   487, -1214, -1214, -1214,
    1157,  1040,   681,  1050,  1137,  1139, -1214, -1214, -1214, -1214,
   -1214,  1170,   675,   738,  1149,  1061,   310, -1214,   131,  1171,
      97,   976,   310,   310, -1214,   164, -1214,  1175,  1184,  1169,
   -1214, -1214,   809,   135,  1066, -1214,   310,  1073,  1166,   164,
     833,   910, -1214, -1214, -1214, -1214, -1214, -1214, -1214, -1214,
    1145, -1214, -1214, -1214,  1075,  2160,  1079, -1214, -1214,   310,
    1070, -1214,  1193, -1214, -1214, -1214, -1214, -1214,  1918, -1214,
   -1214,  1078, -1214, -1214,   775, -1214,   700,   719,   834,  1918,
    1077,  1918,  1174,  1918,   582, -1214, -1214, -1214, -1214, -1214,
   -1214, -1214,   902, -1214, -1214, -1214, -1214, -1214, -1214, -1214,
     348,    49, -1214,  1081, -1214, -1214, -1214, -1214, -1214, -1214,
   -1214, -1214,   310, -1214, -1214,  1086,  2052,  1172,  1187, -1214,
     438, -1214,  2052, -1214,   698, -1214,   310, -1214,   700,  1082,
     119, -1214,  1090,  1096, -1214,  1159, -1214, -1214,   713, -1214,
   -1214, -1214,  1108,  1899, -1214, -1214, -1214, -1214, -1214, -1214,
   -1214, -1214, -1214,   378,  1366, -1214, -1214, -1214, -1214,   378,
     480,   531,  1918, -1214,  1101, -1214,  1110,   574,  1089,  1918,
    1106, -1214, -1214,  1918,  1186,   166, -1214,  1905,   708, -1214,
    1588, -1214, -1214, -1214,   323,   374,   164, -1214, -1214,  1226,
    1227, -1214, -1214, -1214,  1113,   738,   736,  1918,  1116,   544,
    1918,   698,  1918,  1120, -1214,   700,   544,   783,  1105,  1233,
     976,  1121,   218, -1214, -1214,  1119, -1214, -1214, -1214,  1366,
    1221,   310,   882, -1214,  1246,  2453,   880, -1214, -1214, -1214,
     164,  1918,  1123,  1125, -1214, -1214, -1214, -1214, -1214, -1214,
   -1214, -1214, -1214, -1214, -1214, -1214, -1214, -1214, -1214, -1214,
   -1214, -1214, -1214,  1124, -1214,   879,   910,  1075, -1214,   470,
   -1214,  1250, -1214, -1214, -1214, -1214, -1214,   916,  1825,  1129,
    1253, -1214,  1918,  1213, -1214, -1214,  1136,   310,  1212,  1223,
    1740,  1918,   164,   164,   164,  1918,  1918, -1214, -1214, -1214,
    1247,  1138,   544,   583, -1214, -1214, -1214, -1214,  1918, -1214,
     984,   544,  1269,  1154, -1214,   310,   164,  1236, -1214, -1214,
   -1214, -1214, -1214, -1214,   310, -1214,   624, -1214,   310,   310,
   -1214, -1214, -1214, -1214,   105, -1214, -1214,   803, -1214, -1214,
   -1214, -1214, -1214, -1214,  1153,   891, -1214,  1162,  2173, -1214,
    1918,  1163,  1188, -1214,   453,  1165,  1241, -1214, -1214, -1214,
    1918, -1214,  1285,  1294,  1295, -1214, -1214, -1214, -1214,  1296,
    1274,   494,   319,  1299, -1214,  1918,  1306, -1214, -1214,  1189,
    1190, -1214, -1214,  1192, -1214,  1918,  1303, -1214, -1214, -1214,
    1194, -1214, -1214,   151,  1918,  1195,   326, -1214, -1214, -1214,
   -1214,   310,   725,   310,   501,  1229,  1319,  2637,  1229, -1214,
   -1214, -1214, -1214, -1214, -1214,   923, -1214,  1198, -1214, -1214,
    1203, -1214, -1214,  1200,  2173, -1214,   926, -1214, -1214,  1201,
     152,   886,  1320, -1214,  1185, -1214, -1214, -1214,  1333, -1214,
   -1214, -1214, -1214,  1918,  1324,  1138,  1207, -1214,   554, -1214,
    1918,   554,  1208,  1280,  1905, -1214,  1281, -1214,   164,   144,
    1282, -1214,  1186, -1214, -1214,  1918,  1918,    82,   103,  2052,
     740,    75,   132,   310,  1058,   668,   700, -1214, -1214, -1214,
   -1214, -1214, -1214,  1170,  1918,  1356, -1214, -1214,  1918,  1218,
    1263, -1214,  1228,  1373,  1298,  1329,  1330,   164, -1214,  1335,
    1338,  1598,  1350,  1918,  1239,    93, -1214,  1357, -1214, -1214,
   -1214,  1243,  1918, -1214, -1214,  1244, -1214, -1214,   746,   932,
     934, -1214,  1249,  1327, -1214, -1214,   164, -1214,  1290,  1290,
   -1214, -1214, -1214, -1214, -1214,   910, -1214,   580, -1214, -1214,
   -1214, -1214,  1252,   910, -1214,   606,  1359,  1105,  1256, -1214,
      94,  1363, -1214, -1214,  1918,  1257,   166, -1214, -1214, -1214,
    1918,  1309,  1264, -1214,  1918,  1265,  1318,  1918,  1268,  1381,
    1366, -1214,  1918,  1270,  1272,  1397, -1214, -1214,  1918, -1214,
     106,  1279, -1214, -1214,    81, -1214, -1214,    75, -1214, -1214,
    1286, -1214, -1214,  1918, -1214,  1410,  1918, -1214, -1214,  1918,
    1400,  1411,  1899, -1214,   309,   976,   976,  1291,   976,   976,
   -1214, -1214,  1695, -1214,  1598,  1412,   164, -1214,  1300,  1304,
    1414, -1214, -1214, -1214, -1214,  1393,   310, -1214, -1214,  1366,
   -1214, -1214,   164, -1214,  1436, -1214, -1214, -1214,  1382, -1214,
   -1214,  1328, -1214, -1214,   164,  1305, -1214,  1430,  1310, -1214,
   -1214,  1311, -1214,  1383, -1214, -1214, -1214,   670,  1317,  1339,
    1321,    54, -1214, -1214,   134, -1214,  1918, -1214, -1214,  1366,
     658, -1214, -1214, -1214, -1214,  1426,  1431,  1395,  1918, -1214,
   -1214,   755, -1214, -1214, -1214,  1918, -1214,  1322,  1905, -1214,
    1905, -1214,  1334,   738,  1417,  1442,  1336,  1899,   100, -1214,
    1451,  1423,  1340, -1214,  1423,  1341, -1214, -1214,  1306, -1214,
   -1214,  1598, -1214, -1214, -1214,  1345,   310,   273, -1214, -1214,
   -1214, -1214,   164,   164, -1214,  1483,   795, -1214,  1456, -1214,
   -1214,  1899, -1214,  1057,   564,  1918,  1918, -1214,  1918, -1214,
    1351,   138, -1214,   164,  1383,  1918,  1424, -1214, -1214, -1214,
    1425, -1214, -1214,  1285,  1352,   738, -1214,  1414,  1598,  1354,
    1414, -1214,  1360,  1455,  1461,  1362, -1214,  1364, -1214, -1214,
   -1214,  1059, -1214, -1214, -1214,  1361, -1214, -1214,  1368,   164,
   -1214, -1214,  1370,  1358,   471, -1214,  1918,  1488, -1214,   554,
    1918, -1214,  1443, -1214, -1214,   139,  1444, -1214, -1214,  1377,
    1379, -1214, -1214, -1214,  1918,  1899, -1214,  1495,  1384,  1777,
    1385, -1214,  1598,  1386, -1214,  1414,   976, -1214, -1214,   168,
    1918, -1214, -1214,  1059, -1214, -1214, -1214, -1214,  1511, -1214,
   -1214, -1214,  1462,  1500,  1918,  1459, -1214, -1214,  1899, -1214,
     142,  1918, -1214, -1214,   498, -1214,  1394,  1497, -1214,  1482,
   -1214, -1214, -1214, -1214, -1214, -1214,  1396, -1214,  1598,  1510,
    1239,  1513,  1918, -1214, -1214,    94, -1214, -1214,  1398, -1214,
    1899,   807, -1214, -1214,  1525, -1214,   976,  1506, -1214,  1524,
   -1214, -1214,  1598,  1598,  1519, -1214,  1408, -1214, -1214,   827,
    1918, -1214,    94,  1416,   976,  1543, -1214, -1214,  1598, -1214,
   -1214,  1918, -1214, -1214,  1418, -1214,  1421,   164, -1214, -1214,
   -1214, -1214,  1427, -1214, -1214
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
   -1214, -1214, -1214, -1214,   -25, -1214,   354, -1214, -1214, -1214,
     -26,  1553, -1214, -1214, -1214,  1565,    11,  1097, -1214, -1214,
     779, -1214, -1214, -1214, -1214, -1214, -1214, -1214, -1214, -1214,
    1062, -1214, -1214, -1214, -1214, -1214,  1224, -1214, -1214,   380,
   -1214,  1388, -1214, -1214, -1214,  1568, -1214,  1371, -1214, -1214,
     -47,   -79, -1214,   -82, -1214, -1214, -1214,  -359, -1214, -1214,
    -209,   669,     7, -1214, -1214, -1214, -1214,  1487, -1214, -1214,
      40, -1214,    10, -1214,   829, -1214, -1214,  -110,  -915, -1214,
    -732, -1214, -1214, -1214, -1214,   699,  -626, -1214, -1214,   -64,
   -1214, -1214,   483,   979, -1214,   645,   283, -1214, -1214,  2306,
     760, -1214,  -568, -1214,   750,  -236,   445, -1214,    34,    39,
   -1214, -1214,  1535,  -454,  -294, -1214,  1337, -1214, -1214, -1214,
    -351,  -461, -1214, -1214,   -54, -1214, -1214, -1214, -1214, -1214,
   -1214, -1214, -1214, -1214, -1214, -1214, -1214, -1214, -1214, -1214,
     300, -1214, -1214, -1214, -1214, -1214,   523, -1214, -1214, -1214,
    -293, -1214,   -85, -1214,  -150, -1214, -1214, -1214,  -899,   -86,
    -453,   951, -1214, -1214,   -22, -1214, -1214,   -74,   663, -1214,
   -1214, -1214, -1214, -1214, -1214, -1214, -1214,    -4, -1214, -1214,
   -1214,   -19,   -38, -1214, -1214, -1214, -1214,   589, -1214, -1214,
     115,   170, -1214, -1214, -1214,   756, -1214,  -485, -1214, -1214,
   -1214, -1214, -1214, -1214, -1214, -1214, -1214, -1214, -1214, -1214,
   -1214,   192,  -231, -1214, -1214, -1214, -1214, -1214, -1214,   250,
   -1214, -1214, -1214,  -442,   266,  -924, -1214, -1214,  -935, -1214,
   -1214,  -528,   475, -1214, -1214,  -437, -1214, -1214, -1214,   458,
   -1098, -1214, -1214,   254, -1214, -1211, -1214,  1316,   -27, -1214,
   -1214,   497,   -18, -1214, -1214, -1214, -1214,   677, -1214, -1214,
    -742, -1214, -1214, -1214, -1214,  -413,   504, -1214,  -877, -1129,
   -1214, -1214, -1214,   165, -1214, -1213, -1214, -1214, -1214, -1214,
   -1214, -1214, -1214, -1214, -1214, -1214, -1214, -1214, -1214, -1214,
   -1214, -1214, -1214, -1214, -1214,  -456, -1214, -1214,   859, -1214,
    -879, -1214,   860, -1214, -1214, -1214,  -439, -1214,  1563, -1214,
   -1214,  -715, -1214, -1214, -1214, -1214, -1214, -1214, -1214, -1214,
   -1214, -1214, -1214, -1214,   703, -1214,   428,  -830,  -657, -1214,
     432, -1214,   -36,   -17,   550, -1214, -1214, -1214,     0, -1214,
      52,   251,  -114, -1214, -1214, -1214,   570, -1214, -1214, -1214,
   -1214,   452, -1214, -1214, -1214, -1214,   982, -1214,  1176,   414,
     -73,  -604, -1214, -1214, -1214, -1214,   381, -1214, -1214, -1214,
   -1214,   242, -1214, -1214, -1214, -1214,    85, -1214, -1214, -1070,
     253, -1214,   195,   881, -1156, -1214, -1214, -1214, -1214, -1214,
    1083,   405,  -513, -1214, -1214,   -93,  1628, -1214, -1214, -1214,
   -1214, -1214, -1214, -1214,   464,  1419, -1214, -1214
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -922
static const yytype_int16 yytable[] =
{
      19,   160,    56,    23,    25,    62,   125,    14,   268,   198,
      15,   683,   248,   218,   202,   210,   229,   675,   221,   666,
     667,   234,   585,    38,   316,   410,    93,    97,    59,    60,
      61,    63,    66,   522,    78,  1133,   393,   950,   298,   297,
     420,   421,   422,   423,   424,   217,  1132,   189,   228,   191,
     205,    23,   207,   774,   223,    24,   224,   236,   684,   237,
     898,  1242,   992,   699,   113,   114,   201,    71,  1069,   204,
     296,   208,    72,   222,   994,   225,   235,   696,   238,  1150,
     998,   809,   697,   363,   203,   894,     2,   860,     2,  1395,
     836,   837,    21,     2,  1138,   200,   186,   266,   106,   242,
       2,     2,   220,    24,  1145,   231,   698,     2,   249,   250,
    1258,   251,   554,   211,   431,   431,   329,  1264,   334,   609,
    1412,   341,    23,   133,   346,   786,   303,   674,   305,  1296,
     988,   313,   431,   382,  1358,  1416,  1440,   321,   323,   325,
     890,   328,    63,    20,    63,    63,   340,    63,   343,   345,
      63,   347,   892,   555,    71,   211,   903,   675,   290,   263,
     432,   432,  1418,    21,     2,  -623,  1418,  1258,   778,   211,
    1358,     2,    21,     2,    24,     2,  1183,    71,   432,    26,
     669,   352,   353,   558,  1250,   358,  1008,     2,   211,   544,
     324,     7,   362,   319,   362,    66,   297,    51,    24,  1246,
     904,   989,   374,   354,  1538,    67,  1417,   495,    21,     2,
    1245,  1482,  -773,    87,   369,   369,    52,    71,    71,   685,
       2,   123,   124,    72,   816,   522,  1490,    23,   212,  1493,
    1225,  -319,   474,   124,  1259,  1362,   657,   665,   413,   500,
    -358,  -358,  -319,  -358,   504,  1297,   882,   705,  1236,  -455,
     709,  1330,  1441,  1024,   406,   407,   406,   723,  1359,   724,
     877,   414,   983,  -364,   744,   878,   371,   831,  1009,   -53,
     821,   499,   360,    71,  1071,  1016,    67,   123,   124,    24,
     507,   401,   508,   100,  1536,    67,  1419,   522,   601,   881,
    1478,  1519,   559,  1452,  1552,  1251,   503,   997,  1073,   506,
     480,   509,   229,  1194,  -773,    87,   417,   234,    21,     2,
     491,   491,   491,   520,   505,   290,    21,     2,   817,   510,
     486,    67,   560,  -184,   475,   672,   349,   537,   502,    21,
       2,   565,    21,     2,   228,  -186,  1455,  1032,   517,  1378,
    1491,  1371,     2,   236,    -3,   237,   111,  1361,    63,   112,
     561,  1351,     1,   613,    21,     2,  1179,    63,  1549,   352,
     567,    71,   235,   517,   238,   473,    21,     2,   514,   598,
     981,   377,   577,   578,   601,   100,   473,   984,   602,  1180,
     830,   270,   264,   271,    21,     2,   590,   593,   594,  1198,
    1282,   231,    45,   297,  1534,   599,     2,  1328,   302,  1514,
      21,     2,  1255,  1377,    52,   740,   518,   285,   522,   606,
    1399,   670,   306,  -623,  1583,   612,  1566,  1262,  1048,   123,
     124,    67,   665,   665,   838,   839,    50,   272,   772,    67,
     273,   773,  1045,   908,  -549,   297,    54,  1046,   591,     7,
    1561,    96,    67,  1584,  1430,    67,   608,  1060,   123,   124,
    1422,   614,   304,  1227,   431,   666,   947,   473,  -319,   123,
     124,  1047,  1164,    98,  1576,  1577,   515,    67,   196,  -319,
     520,   354,   474,   124,  -407,  -407,    21,     2,    69,    67,
    1588,   335,   677,   270,   264,   271,    21,     2,   856,   689,
    1334,   902,   726,    21,     2,   520,   522,    67,   727,   486,
     432,  1508,   209,     2,  -586,  1165,    21,     2,     2,    99,
     822,  1326,   290,    67,    23,   116,   321,   728,    71,    21,
       2,   660,   661,    72,   330,   281,   700,   336,  1554,   272,
     122,  1203,   273,   297,     2,  1515,   298,   297,   100,    31,
     474,   124,   108,   710,   825,   805,   608,   473,   729,   692,
     828,   350,  1411,    71,   290,   367,   431,   544,   431,   747,
     117,   840,   841,   842,   425,    69,    24,    84,   296,   118,
     331,   522,   765,    33,   608,   751,   708,   608,  -184,  1411,
     522,   793,   -74,   297,   608,   806,   608,     2,   332,    67,
     109,   608,   730,   884,  1238,   484,   590,   393,   545,    67,
     -74,   815,   432,   393,   432,   110,    67,   665,   665,   766,
    1318,   748,  1239,   665,  1019,    71,   712,   919,   357,    67,
    1539,  1542,     2,   713,   604,   182,   335,   281,   355,    69,
     712,   731,    67,  -921,    21,     2,   818,   713,  1127,   687,
      28,  1177,   475,   183,   -74,  1051,  1515,   714,   591,    64,
     601,    29,   290,   -74,   120,     2,   290,   121,    30,  1381,
    1382,   714,  1384,  1385,    21,     2,   700,    65,  1469,  1129,
     122,    31,   336,   665,  1130,    97,     1,   617,  -353,  1020,
    -353,    21,     2,   115,   378,   688,    32,   184,   -37,   897,
     517,   -37,    69,   869,  -407,   342,   185,   870,   871,   872,
     122,     2,   290,   912,  -407,    33,   873,   129,  1339,  -604,
     715,  1154,   970,   970,  -608,    63,   624,    69,   999,   811,
      71,   473,   406,   812,  1324,    21,     2,    34,  1210,    63,
     122,   918,   971,  1146,   602,    69,    71,  -623,  1000,  1001,
      71,   680,   374,  1002,   666,   667,   895,    71,   297,   270,
     264,   271,    21,     2,   372,    31,  1003,   111,   518,   540,
     608,   673,   676,   874,   130,  1152,   131,    23,   344,  1546,
     123,   124,   521,   434,     2,  1059,   135,    67,   -38,  1015,
     373,   -38,  1038,   608,   264,  -836,    21,     2,  1201,    33,
    1202,   265,   137,    64,    67,   272,   666,   239,   273,     2,
     694,   695,  1565,   673,   474,   124,  -407,  -407,  1388,   435,
     901,   484,   436,  1039,   123,   124,     2,   437,  1040,    24,
    -886,  1376,   520,   181,    71,  1580,   122,   123,   124,  -838,
     192,   721,  1108,   861,   914,   960,    71,  -664,  -664,  -664,
    -664,  -664,     2,  1094,   214,   438,   123,   124,   310,  -799,
    1006,   439,   915,   763,   227,   666,  -319,    69,   311,  -331,
    -331,   111,    69,  -799,   754,    67,   312,   290,  -799,  -331,
    1537,   123,   124,   607,   123,   124,   406,  -402,  1091,   607,
    -211,   658,   659,  -664,  -211,   245,  -664,   823,  1263,   660,
     661,   252,   812,   281,  -799,   666,   182,    21,     2,    71,
    1304,   673,   832,  1427,  1450,   285,   120,   812,    71,   853,
    1088,  -799,   477,   478,   264,   146,  1439,     2,  -799,  -799,
    1097,   247,   255,   200,   256,   257,   211,  1089,  -244,    69,
    1573,   122,   111,   254,   972,  1068,   973,   840,   841,   842,
     393,     4,  1338,  1076,   111,  1082,  1107,  1461,  1586,  1111,
    1463,   851,   974,  -664,   253,  -664,  1570,    69,    33,  1571,
      69,   111,   665,   543,   521,     5,     6,   308,   975,  -664,
    -664,   314,  1137,  1139,  1141,   315,  1581,  -664,  -664,  1582,
    1195,  -664,   348,    71,   976,    69,   359,    69,    69,   349,
     111,   961,   550,   474,   124,    69,   406,    69,   576,     2,
    1158,    71,    69,   467,   468,   469,   470,   111,   229,   557,
     621,   622,   825,   234,   665,   764,  -694,   111,  -694,   749,
      69,   111,   365,   814,  1526,    23,   521,  1103,  1104,  1151,
    -694,   111,   376,  1083,  -694,   -21,   380,   -21,   608,   366,
     228,   956,  1155,  1156,   402,  1559,   403,    69,   404,   236,
    -694,   237,   963,    69,   965,  1184,   969,  1551,   912,  1266,
     845,   846,   847,   848,  1113,  1114,  -694,   411,   235,   412,
     238,  1214,  1215,   665,  1222,  1223,   416,    24,  1268,  1269,
    1305,  1306,  1308,  1309,    63,  1465,  1466,  1499,  1500,  1569,
     492,   493,   419,   472,   479,  -359,   482,   231,   481,   494,
     512,   919,   516,  1454,   511,   538,   542,   111,   548,  1108,
     475,   549,   551,   665,   553,   608,  1014,   608,   552,   562,
     514,   563,   559,   570,   568,   569,   572,   575,   595,   573,
      56,   857,   574,   579,   582,  1021,   584,   589,  1249,   596,
     616,   605,  1027,   600,   668,   686,  1029,   875,   701,   601,
     618,   889,   678,  1044,   611,   703,   619,    69,   896,   682,
     702,   706,   711,   718,   750,   719,   722,   745,   725,   743,
    1061,    69,    33,  1063,   755,  1066,   767,  1287,   802,  -408,
    -408,   804,   808,   824,   827,  1299,   833,  1267,   270,   264,
     271,    21,     2,   850,    69,  -408,   852,   297,   855,   859,
     602,  -408,   862,   863,  1098,  -408,  1313,   865,   866,   885,
    1387,   887,   544,   891,   899,   918,   900,  1321,   907,   911,
     909,   920,   948,  1107,  -408,   921,   946,   949,   967,   964,
    1332,   958,   990,  -900,   272,   982,   996,   273,  1025,   995,
     756,   763,  1011,  1007,  1012,  1119,   269,   991,   270,   264,
     271,    21,     2,  1022,  1135,  1030,  1013,  1028,  1142,  1143,
     973,    69,  1023,  1434,  1363,  1058,  1055,  1070,  1062,  1074,
      71,  1147,  1067,  1072,  1081,  1099,  1085,  1100,  1101,  -408,
    1112,  1117,  1184,  1118,  1350,  1120,   825,   757,  1121,  1123,
     758,  1125,   297,  1144,   272,   961,  1392,   273,  1406,  1148,
     274,  1149,   275,  1153,    67,  1157,   276,  -408,  -408,  -408,
     982,  -408,  1401,  1161,  1159,  1162,   290,  1167,  1163,   521,
     277,   278,  1168,  1170,    63,  1488,   297,  1171,   279,   280,
    1173,  1174,   281,  1175,  1176,  1181,  1185,  1206,  1182,   759,
    1397,  1188,  1189,  1350,  1190,  1192,  1193,  1197,  1191,  1208,
    1218,  1219,  1220,  1224,  1228,  1230,    69,  1196,  1234,  1237,
    1243,  1244,  1247,  1252,    67,  1273,   276,  1276,  1278,   270,
     264,   271,    21,     2,  1281,  1279,  1285,  1286,  1442,  1282,
     277,   278,  1288,  1350,   475,  1289,  1294,  1300,   279,   280,
    1251,  1312,   281,   183,   355,  1301,  1303,   763,  1314,  1346,
     297,  1311,  1456,  1457,  1322,  1333,  1233,  1531,  1329,  1336,
      82,   290,   378,  1241,  1342,   272,  1343,  1345,   273,   -63,
    1348,  1349,  1353,  1481,  1354,   -63,   -63,  1355,  1256,  1257,
     608,  1360,   -63,   297,   -63,   -63,  1365,  1373,  1370,  1383,
      69,  1375,   -63,   -63,   -63,   290,  1396,  1272,  1391,    69,
    1296,  1275,  1393,    69,    69,  1402,  1394,  1407,  1403,  1505,
    1408,  1405,  1409,  1410,  1411,   297,  1295,  -887,   -63,  1414,
     -63,  1415,  1423,  1424,  1429,  1302,  1425,  1435,  1437,   -63,
     -63,  1443,  1433,  1444,   -63,    67,   270,   -63,   -63,  1438,
    1462,  1495,  1446,  1448,   -63,   -63,   -63,  1453,   -63,  1540,
    1184,   658,   659,  1477,  1487,  1484,  1485,  1492,  1496,   660,
     661,  1507,  1494,   281,  1497,  1304,  1498,  1335,  1513,   290,
    1504,    69,  1506,  1341,  1518,  1521,    69,  1344,    69,  1522,
    1347,  1523,  1527,  1545,  1547,  1352,  1529,  1533,  1535,  1548,
    1550,  1357,  1557,  1555,  1556,  1332,  1562,  1572,  1560,  1563,
    1568,   138,   290,  1574,  1575,  1578,  1369,   139,   140,   764,
    1579,  1587,  1372,    27,   141,  1014,   142,   143,  1585,  1317,
    1590,   -63,  1332,  1591,   144,   145,   146,    37,   693,  1594,
      47,   679,   364,   566,   290,  1090,   370,  1593,   244,  1043,
    1064,   270,   264,   271,    21,     2,   959,  1229,    69,  1018,
      32,   835,     4,  1116,  1017,   126,  1398,  1205,   138,   418,
    1109,   147,   148,   844,   139,  1290,   149,  1160,  1543,    33,
     150,   141,  1503,   142,   143,  1486,     5,     6,   151,  1421,
     152,   144,   145,   146,  1447,  1054,  1432,   272,  1271,  1293,
     273,  1426,  1449,   534,  1122,  1261,  1254,  1524,  1428,   985,
     986,   206,  1110,  1325,  1221,  1323,  1460,    32,  1213,     4,
    1014,  1316,   854,  1479,   681,  1379,  1589,  1471,   147,   148,
    1520,   987,  1364,   149,    90,     0,    33,   150,     0,   810,
     415,  1337,     0,     5,     6,   151,     0,   152,     0,     0,
       0,     0,     0,     0,  1014,     0,     0,     0,  1472,  1475,
       0,  1476,     0,   153,     0,   138,     0,    67,  1483,   276,
       0,   139,  1386,     0,     0,     0,     0,     0,   141,     0,
     142,   143,     0,   277,   278,     0,     0,     0,   144,   145,
     146,   279,   280,     0,     0,   281,     0,     0,     0,     0,
       0,  1126,     0,   270,   264,   271,    21,     2,     0,  1512,
       0,    69,     0,     0,    32,     0,     4,     0,     0,     0,
     153,     0,     0,     0,     0,   147,   148,  1525,  1014,     0,
     149,     0,     0,    33,   150,     0,     0,     0,     0,     0,
       5,     6,   151,  1541,   152,     0,     0,   138,     0,   272,
       0,     0,   273,   139,  1530,    69,     0,  1472,     0,     0,
     141,  1014,   142,   143,  1553,     0,     0,     0,     0,     0,
     144,   145,   146,     0,  1127,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,  1564,     0,     0,   270,   264,
     271,    21,     2,  1014,     0,     0,    32,  1033,     4,     0,
       0,    69,     0,     0,  1128,  1129,     0,   147,   148,     0,
    1130,  1131,   149,  1472,     0,    33,   150,   153,     0,    67,
       0,   276,     5,     6,   151,     1,   152,  -323,     0,     0,
      21,     2,     0,     0,   272,   277,   278,   273,     0,   517,
     756,     0,     0,   279,   280,     0,     0,   281,     0,     0,
       0,     0,  -510,  -510,  -510,     0,     0,     0,     0,     0,
       0,     0,   270,   264,   271,    21,     2,     0,   270,   264,
     271,    21,     2,  -323,     0,     0,     0,     0,     0,     0,
       0,   270,   264,   271,    21,     2,  -623,     0,     0,     0,
     758,     0,     0,     0,     0,     0,     0,     0,     0,   153,
       0,     0,     0,     0,    67,  -510,   276,   518,   272,     0,
       0,   273,   519,     0,   272,     0,   275,   273,     0,     0,
     277,   278,     0,     0,     0,     0,     0,   272,   279,   280,
     273,     0,   281,     0,  -323,  -323,  -323,     0,  -323,  -323,
    -323,  -323,     0,    67,     0,  -323,  -323,   129,     0,     0,
       0,     0,     0,     0,     0,     0,  -323,     0,     0,    21,
       2,     0,  1033,     0,     0,     0,     0,     0,   517,     0,
       0,   520,     0,     0,     0,   768,     0,     0,    67,     0,
     276,  -638,  -638,  -638,    67,     0,   276,     0,     0,     0,
       0,     0,   769,     0,   277,   278,   440,    67,     0,   276,
     277,   278,   279,   280,     0,   770,   281,     0,   279,   280,
       0,     0,   281,   277,   278,     0,     0,     0,     0,     0,
     771,   279,   280,     0,     0,   281,     0,     0,     0,     0,
       0,     0,   441,   772,  -638,   442,   773,   384,     0,     0,
     443,     0,     0,     0,     0,   385,     0,   386,   452,   453,
     454,   455,   456,   457,   458,   459,   460,   461,   462,   463,
     464,   465,   466,     0,   467,   468,   469,   470,   444,     0,
       0,   387,    67,   388,   445,   446,   447,   448,   449,   450,
     451,     0,   389,     0,     0,     0,     0,   390,     0,     0,
       0,   391,     0,     0,     0,     0,     0,     5,     6,     0,
     520,   392,     0,     0,     0,     0,   452,   453,   454,   455,
     456,   457,   458,   459,   460,   461,   462,   463,   464,   465,
     466,   923,   467,   468,   469,   470,     0,     0,     0,     0,
       0,     0,     0,   924,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   925,   926,   927,   924,     0,     0,     0,
       0,   928,     0,   929,     0,   930,   925,   926,   927,     0,
       0,     0,     0,   931,   928,     0,   929,     0,   930,     0,
       0,     0,     0,     0,     0,     0,   931,     0,     0,   932,
       0,   933,     0,     0,     0,     0,     0,     0,     0,     0,
     934,   935,   932,     0,   933,   936,   937,     0,     0,   938,
       0,     0,     0,   934,   935,     0,     0,   939,   936,   937,
       1,     0,   938,     0,     0,     0,     2,     0,     0,     0,
     939,     0,   -24,     0,     0,     0,   940,     0,     0,   941,
       0,     0,     0,   -24,   942,     0,     0,     0,     0,   940,
     -24,     0,   941,     0,     3,     0,     0,   942,    79,     0,
       0,     0,     0,   -24,     0,     0,     0,   -52,     0,     0,
       0,     0,     0,   -52,   -52,     0,     0,     0,   -24,     0,
       4,  -623,   -52,   -52,     0,     0,     0,   -52,     0,     0,
     -52,     0,   -52,     0,    80,     0,     0,   -24,     0,     0,
       0,     0,     0,     0,     5,     6,     0,     7,     0,     0,
       0,     0,     0,     0,     0,     0,   -52,   -52,   -52,   -24,
       0,     0,     0,     0,     0,    86,     0,   -52,   -52,     0,
       0,     0,   -52,     0,   -84,   -52,   -52,     0,     0,     0,
     -84,     0,   -52,   -52,   -52,     0,   -52,   -84,     0,   -84,
     -84,     0,     0,     0,   -84,     0,     0,   -84,    91,   -84,
       0,    87,     0,     0,     0,     0,     0,   -99,     0,     0,
       0,     0,     0,   -99,     0,     0,     0,     0,     0,     0,
       0,     0,   -99,   -84,     0,   -84,     0,   -99,     0,     0,
     -99,    94,   -99,     0,   -84,   -84,     0,     0,     0,   -84,
    -201,     0,   -84,   -84,     0,     0,  -201,  -201,     0,   -84,
     -84,   -84,     0,   -84,     0,  -201,   -99,     0,   -99,     0,
       0,     0,     0,  -201,  1086,  -201,     0,     0,   -99,     0,
       0,     0,   -99,  -810,     0,   -99,   -99,     0,     0,  -810,
       0,     0,   -99,   -99,   -99,     0,   -99,     0,  -810,  -201,
       0,  -201,     0,  -810,     0,     0,  -810,   383,  -810,     0,
       0,  -201,     0,  -220,     0,  -201,     0,     0,  -201,  -201,
       0,     0,     0,     0,     0,  -201,  -201,  -201,     0,  -201,
       0,   384,  -810,     0,  -810,     0,     0,     0,     0,   385,
       0,   386,     0,     0,  -810,     0,     0,     0,  -810,     0,
       0,  -810,  -810,     0,     0,   138,     0,     0,  -810,  -810,
    -810,   139,  -810,     0,     0,   387,     0,   388,   141,     0,
     142,   143,     0,     0,     0,   194,   389,     0,   144,     0,
     146,   390,     0,     0,     0,   391,     0,   138,     0,     0,
       0,     5,     6,   139,   496,   392,     0,     0,     0,     0,
       0,     0,   142,   143,   195,     0,     4,     0,     0,     0,
     144,     0,   146,     0,     0,   147,   148,     0,     0,     0,
     149,     0,     0,    33,   150,     0,     0,     0,     0,     0,
       5,     6,   151,     0,   152,     0,    32,     0,     4,     0,
       0,     0,     0,     0,     0,   138,     0,   147,   148,     0,
       0,   139,   149,     0,     0,    33,   150,     0,     0,     0,
     142,     0,     5,     6,   151,   215,   152,   138,   144,     0,
     146,     0,     0,   139,     0,     0,     0,     0,     0,     0,
     138,     0,   142,     0,     0,     0,   139,  1209,     0,     0,
     144,     0,   146,     0,    32,   142,     4,     0,     0,     0,
       0,     0,     0,   144,     0,   146,   148,     0,     0,     0,
     149,     0,     0,    33,   150,     0,    32,     0,     4,     0,
       5,     6,   151,     0,   152,     0,     0,     0,   148,    32,
       0,     4,   149,     0,     0,    33,   150,     0,     0,     0,
       0,   148,     5,     6,   151,   149,   152,     0,    33,   150,
       0,     0,     0,     0,     0,     5,     6,   151,     0,   152,
     625,   626,   627,   628,   629,   630,   631,   632,   633,   634,
     635,   636,     0,     0,     0,     0,     0,     0,   637,   638,
     639,   640,   641,   642,   643,   644,   645,   646,   647,   648,
     649,   650,   651,   652,   653,   654,   655,   656,  -922,  -922,
    -922,  -922,  -922,  -922,  -922,  -922,  -922,  -922,  -922,  -922,
     464,   465,   466,     0,   467,   468,   469,   470
};

static const yytype_int16 yycheck[] =
{
       0,    83,    20,     3,     4,    31,    70,     0,   122,    88,
       0,   496,   105,    92,    88,    88,    95,   478,    92,   473,
     473,    95,   381,    12,   134,   256,    51,    54,    28,    29,
      30,    31,    32,   327,    34,   970,   245,   752,   124,   124,
     276,   277,   278,   279,   280,    92,   970,    85,    95,    85,
      88,    51,    88,   581,    92,     3,    92,    95,   497,    95,
     717,  1131,   804,   519,    64,    65,    88,    33,   898,    88,
     124,    88,    33,    92,   806,    92,    95,   519,    95,   994,
     812,   594,   519,   193,    88,   711,     7,   691,     7,  1300,
     658,   659,     6,     7,   973,    88,    85,   122,    58,    99,
       7,     7,    92,    51,   981,    95,   519,     7,   108,   109,
      28,   111,     1,    37,    27,    27,   142,    42,   144,   412,
    1333,   147,   122,     1,   150,   581,   126,   478,   128,    36,
      81,   131,    27,   243,    28,    81,    36,   137,   138,   139,
       9,   141,   142,    30,   144,   145,   146,   147,   148,   149,
     150,   151,    55,    42,   120,    37,    21,   618,   124,   120,
      73,    73,    28,     6,     7,    62,    28,    28,   581,    37,
      28,     7,     6,     7,   122,     7,  1055,   143,    73,     0,
     474,   181,   182,    42,    40,   185,    67,     7,    37,    37,
     138,    88,   192,    13,   194,   195,   281,    35,   146,  1134,
      65,   152,   227,     1,    36,   119,   152,   317,     6,     7,
    1134,  1424,    60,    37,   214,   215,    42,   183,   184,   512,
       7,   146,   147,   184,    67,   519,  1437,   227,   152,  1440,
      78,   156,   146,   147,   152,   154,   472,   473,   159,   318,
     153,   153,   156,   155,   318,   152,   702,   540,  1125,   152,
     543,   157,   152,   857,   254,   255,   256,   550,   152,   552,
     702,   261,   790,   152,   557,   702,   226,   618,   149,   147,
     152,   318,    59,   239,   900,   843,   119,   146,   147,   227,
     318,   247,   318,   107,  1495,   119,   152,   581,   156,   702,
     152,   152,   151,  1391,   152,   151,   318,   810,   902,   318,
     300,   318,   381,   152,   152,    37,   272,   381,     6,     7,
     310,   311,   312,   147,   318,   281,     6,     7,   161,   319,
     309,   119,   348,   147,   290,   475,   152,   327,   318,     6,
       7,   357,     6,     7,   381,    67,    63,   865,    15,    30,
    1438,  1276,     7,   381,     0,   381,   149,  1262,   348,   152,
     350,  1250,     1,   417,     6,     7,    37,   357,  1514,   359,
     360,   327,   381,    15,   381,    63,     6,     7,    53,   395,
      22,    11,   372,   373,   156,   107,    63,   790,   160,    60,
     616,     3,     4,     5,     6,     7,   386,   387,   388,    63,
      81,   381,    12,   478,  1492,   395,     7,  1227,    63,  1469,
       6,     7,  1144,  1282,    42,   555,    83,   124,   702,   409,
    1309,   475,   129,    62,  1570,   415,  1545,  1149,   874,   146,
     147,   119,   658,   659,   660,   661,    12,    49,    80,   119,
      52,    83,   874,   726,    60,   520,   151,   874,   386,    88,
    1538,    62,   119,  1572,  1368,   119,   412,   886,   146,   147,
    1349,   417,    63,  1110,    27,   909,   749,    63,   156,   146,
     147,   874,     9,   152,  1562,  1563,   151,   119,    88,   156,
     147,     1,   146,   147,   148,   149,     6,     7,    33,   119,
    1578,    11,   482,     3,     4,     5,     6,     7,     1,   514,
    1232,   722,     8,     6,     7,   147,   790,   119,    14,   488,
      73,    30,    88,     7,   130,    52,     6,     7,     7,    62,
     603,  1226,   478,   119,   514,    25,   516,    33,   484,     6,
       7,   143,   144,   484,    11,   147,   152,    57,    30,    49,
     156,    30,    52,   618,     7,  1470,   622,   622,   107,    44,
     146,   147,    53,   543,   608,   107,   512,    63,    64,   515,
     614,    24,    81,   519,   520,    59,    27,    37,    27,   559,
      70,   134,   135,   136,   281,   120,   514,     1,   622,    79,
      57,   865,   572,    78,   540,   564,   542,   543,   147,    81,
     874,   581,    16,   668,   550,   147,   552,     7,   143,   119,
      53,   557,   108,   703,    40,   100,   596,   806,    78,   119,
      34,   601,    73,   812,    73,    42,   119,   843,   844,   575,
      30,   559,    58,   849,   850,   581,    24,   731,   118,   119,
    1499,  1500,     7,    31,   147,    16,    11,   147,   183,   184,
      24,   147,   119,   156,     6,     7,   602,    31,    74,    11,
      13,   147,   608,    34,    78,   876,  1581,    55,   596,     1,
     156,    24,   618,    87,   149,     7,   622,   152,    31,  1285,
    1286,    55,  1288,  1289,     6,     7,   152,    19,   104,   105,
     156,    44,    57,   909,   110,   702,     1,   148,   149,   148,
     149,     6,     7,    42,   239,    57,    59,    78,   149,   715,
      15,   152,   247,    18,    36,     1,    87,    22,    23,    24,
     156,     7,   668,   729,    46,    78,    31,   147,  1236,    34,
     118,  1004,   130,   130,    39,   715,   433,   272,    20,   148,
     686,    63,   722,   152,   118,     6,     7,   100,  1087,   729,
     156,   731,   150,   150,   160,   290,   702,    62,    40,    41,
     706,    30,   767,    45,  1198,  1198,   712,   713,   833,     3,
       4,     5,     6,     7,    35,    44,    58,   149,    83,   151,
     726,   478,   479,    88,    42,   996,    30,   767,     1,  1511,
     146,   147,   327,    12,     7,   885,    60,   119,   149,   833,
      61,   152,    74,   749,     4,   161,     6,     7,  1081,    78,
    1083,    11,    30,     1,   119,    49,  1250,   147,    52,     7,
     517,   518,  1544,   520,   146,   147,   148,   149,  1293,    48,
       1,   100,    51,   105,   146,   147,     7,    56,   110,   767,
     150,  1282,   147,    30,   790,  1567,   156,   146,   147,   161,
      30,   548,   946,   152,     1,     1,   802,     3,     4,     5,
       6,     7,     7,   916,    30,    84,   146,   147,    13,    16,
     816,    90,    19,   570,    30,  1309,   156,   412,    23,   146,
     147,   149,   417,    30,   152,   119,    31,   833,    35,   156,
    1496,   146,   147,   409,   146,   147,   876,   152,   916,   415,
     148,   135,   136,    49,   152,   147,    52,   604,   148,   143,
     144,    42,   152,   147,    61,  1349,    16,     6,     7,   865,
     154,   618,   619,   148,  1389,   622,   149,   152,   874,   152,
      30,    78,   148,   149,     4,    35,  1377,     7,    85,    86,
     920,    67,   156,   916,   158,   159,    37,   916,   153,   484,
    1556,   156,   149,    49,    32,   152,    34,   134,   135,   136,
    1149,    61,  1236,   909,   149,   911,   946,   152,  1574,   949,
    1411,   668,    50,   119,    42,   121,   149,   512,    78,   152,
     515,   149,  1198,   151,   519,    85,    86,    30,    66,   135,
     136,   152,   972,   973,   974,   152,   149,   143,   144,   152,
    1073,   147,    79,   949,    82,   540,    30,   542,   543,   152,
     149,   157,   151,   146,   147,   550,   996,   552,     6,     7,
    1025,   967,   557,   138,   139,   140,   141,   149,  1087,   151,
     148,   149,  1076,  1087,  1250,   570,    32,   149,    34,   151,
     575,   149,    47,   151,  1485,  1025,   581,   148,   149,   995,
      46,   149,    17,   151,    50,   149,    42,   151,  1004,   152,
    1087,   758,  1008,  1009,    42,  1530,    42,   602,    49,  1087,
      66,  1087,   769,   608,   771,  1055,   773,  1518,  1084,  1152,
     138,   139,   140,   141,   148,   149,    82,   156,  1087,   151,
    1087,   148,   149,  1309,   148,   149,   148,  1025,    20,    21,
     148,   149,   148,   149,  1084,    28,    29,    28,    29,  1550,
     311,   312,   148,   145,   153,   153,   100,  1087,   148,   152,
     151,  1215,    30,  1396,   152,    42,   151,   149,   151,  1223,
    1076,    42,   152,  1349,   152,  1081,   833,  1083,    42,   152,
      53,    30,   151,   147,   152,   152,    19,    67,    79,   152,
    1148,   686,   152,   152,   148,   852,   148,   148,  1138,    35,
     145,   156,   859,   152,   147,    42,   863,   702,   130,   156,
     149,   706,   152,   870,   156,    37,   153,   712,   713,   152,
     151,   149,    47,   152,    34,    60,    49,   147,   152,   152,
     887,   726,    78,   890,   152,   892,    30,  1177,   149,    20,
      21,    17,    42,   156,   120,  1185,   155,  1153,     3,     4,
       5,     6,     7,   145,   749,    36,   153,  1282,   152,    42,
     160,    42,   152,    66,   921,    46,  1206,    68,    38,    60,
    1292,   150,    37,    42,    30,  1215,    47,  1217,   152,    53,
     147,    76,   152,  1223,    65,   150,   147,    34,    54,   152,
    1230,   153,   151,   147,    49,   790,    49,    52,   149,    67,
      55,   958,   152,   161,   148,   962,     1,   802,     3,     4,
       5,     6,     7,   152,   971,    69,   148,   151,   975,   976,
      34,   816,   152,  1373,  1264,   152,    39,    34,   152,   150,
    1236,   988,   152,   152,    53,   152,    30,   152,   154,   120,
      30,   152,  1282,    30,  1250,    72,  1350,   102,   152,    77,
     105,    68,  1377,    46,    49,   157,  1296,    52,  1324,    30,
      55,   147,    57,    67,   119,   152,   121,   148,   149,   150,
     865,   152,  1312,  1030,   152,   152,  1282,   152,   130,   874,
     135,   136,    81,  1040,  1324,  1435,  1411,    42,   143,   144,
      36,    36,   147,    37,    60,    36,    30,   108,  1055,   154,
    1306,   152,   152,  1309,   152,    42,   152,   152,  1065,    30,
     152,   148,   152,   152,    34,    22,   911,  1074,    34,   152,
     152,    81,    81,    81,   119,     9,   121,   149,   105,     3,
       4,     5,     6,     7,     1,   147,    47,    47,  1378,    81,
     135,   136,    47,  1349,  1350,    47,    36,    30,   143,   144,
     151,    64,   147,    34,   949,   152,   152,  1114,   108,    81,
    1485,   152,  1402,  1403,   152,    42,  1123,  1489,   152,   152,
       1,  1377,   967,  1130,   105,    49,   152,   152,    52,    10,
     152,    40,   152,  1423,   152,    16,    17,    30,  1145,  1146,
    1396,   152,    23,  1518,    25,    26,   150,    37,    28,   148,
     995,    30,    33,    34,    35,  1411,    53,  1164,    36,  1004,
      36,  1168,   152,  1008,  1009,    19,   152,   152,    76,  1459,
      30,   133,   152,   152,    81,  1550,  1183,   150,    59,   130,
      61,   150,    46,    42,   152,  1192,    81,    60,    36,    70,
      71,    30,   148,    60,    75,   119,     3,    78,    79,   153,
      34,    36,   152,   152,    85,    86,    87,   152,    89,  1499,
    1500,   135,   136,   152,   152,    81,    81,   153,    47,   143,
     144,   153,   152,   147,   152,   154,   152,  1234,    30,  1485,
     152,  1076,   152,  1240,    81,    81,  1081,  1244,  1083,   152,
    1247,   152,    37,    22,    72,  1252,   152,   152,   152,    39,
      81,  1258,    60,   149,    47,  1545,    36,    22,   152,    36,
     152,    10,  1518,    47,    30,    36,  1273,    16,    17,  1114,
     152,    18,  1279,    10,    23,  1282,    25,    26,   152,  1215,
     152,   162,  1572,   152,    33,    34,    35,    12,   516,   152,
      12,   484,   194,   359,  1550,   916,   215,  1587,   101,     1,
     891,     3,     4,     5,     6,     7,   767,  1114,  1153,   849,
      59,   622,    61,   958,   844,    70,  1306,  1084,    10,   272,
     947,    70,    71,   662,    16,    17,    75,  1028,  1503,    78,
      79,    23,  1452,    25,    26,  1433,    85,    86,    87,  1346,
      89,    33,    34,    35,  1384,   879,  1370,    49,  1163,  1181,
      52,  1358,  1388,   327,   967,  1148,  1142,  1482,  1365,   790,
     790,    88,   949,  1225,  1104,  1223,  1405,    59,  1088,    61,
    1377,  1209,   680,  1421,   488,  1284,  1581,  1414,    70,    71,
    1475,   790,  1267,    75,    46,    -1,    78,    79,    -1,   596,
     261,  1236,    -1,    85,    86,    87,    -1,    89,    -1,    -1,
      -1,    -1,    -1,    -1,  1411,    -1,    -1,    -1,  1415,  1416,
      -1,  1418,    -1,   162,    -1,    10,    -1,   119,  1425,   121,
      -1,    16,    17,    -1,    -1,    -1,    -1,    -1,    23,    -1,
      25,    26,    -1,   135,   136,    -1,    -1,    -1,    33,    34,
      35,   143,   144,    -1,    -1,   147,    -1,    -1,    -1,    -1,
      -1,     1,    -1,     3,     4,     5,     6,     7,    -1,  1466,
      -1,  1306,    -1,    -1,    59,    -1,    61,    -1,    -1,    -1,
     162,    -1,    -1,    -1,    -1,    70,    71,  1484,  1485,    -1,
      75,    -1,    -1,    78,    79,    -1,    -1,    -1,    -1,    -1,
      85,    86,    87,  1500,    89,    -1,    -1,    10,    -1,    49,
      -1,    -1,    52,    16,    17,  1350,    -1,  1514,    -1,    -1,
      23,  1518,    25,    26,  1521,    -1,    -1,    -1,    -1,    -1,
      33,    34,    35,    -1,    74,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1542,    -1,    -1,     3,     4,
       5,     6,     7,  1550,    -1,    -1,    59,    97,    61,    -1,
      -1,  1396,    -1,    -1,   104,   105,    -1,    70,    71,    -1,
     110,   111,    75,  1570,    -1,    78,    79,   162,    -1,   119,
      -1,   121,    85,    86,    87,     1,    89,    27,    -1,    -1,
       6,     7,    -1,    -1,    49,   135,   136,    52,    -1,    15,
      55,    -1,    -1,   143,   144,    -1,    -1,   147,    -1,    -1,
      -1,    -1,    28,    29,    30,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,     3,     4,     5,     6,     7,    -1,     3,     4,
       5,     6,     7,    73,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     3,     4,     5,     6,     7,    62,    -1,    -1,    -1,
     105,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   162,
      -1,    -1,    -1,    -1,   119,    81,   121,    83,    49,    -1,
      -1,    52,    88,    -1,    49,    -1,    57,    52,    -1,    -1,
     135,   136,    -1,    -1,    -1,    -1,    -1,    49,   143,   144,
      52,    -1,   147,    -1,   134,   135,   136,    -1,   138,   139,
     140,   141,    -1,   119,    -1,   145,   146,   147,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   156,    -1,    -1,     6,
       7,    -1,    97,    -1,    -1,    -1,    -1,    -1,    15,    -1,
      -1,   147,    -1,    -1,    -1,    22,    -1,    -1,   119,    -1,
     121,    28,    29,    30,   119,    -1,   121,    -1,    -1,    -1,
      -1,    -1,    39,    -1,   135,   136,    12,   119,    -1,   121,
     135,   136,   143,   144,    -1,    52,   147,    -1,   143,   144,
      -1,    -1,   147,   135,   136,    -1,    -1,    -1,    -1,    -1,
      67,   143,   144,    -1,    -1,   147,    -1,    -1,    -1,    -1,
      -1,    -1,    48,    80,    81,    51,    83,    25,    -1,    -1,
      56,    -1,    -1,    -1,    -1,    33,    -1,    35,   122,   123,
     124,   125,   126,   127,   128,   129,   130,   131,   132,   133,
     134,   135,   136,    -1,   138,   139,   140,   141,    84,    -1,
      -1,    59,   119,    61,    90,    91,    92,    93,    94,    95,
      96,    -1,    70,    -1,    -1,    -1,    -1,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    86,    -1,
     147,    89,    -1,    -1,    -1,    -1,   122,   123,   124,   125,
     126,   127,   128,   129,   130,   131,   132,   133,   134,   135,
     136,     1,   138,   139,   140,   141,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    13,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    23,    24,    25,    13,    -1,    -1,    -1,
      -1,    31,    -1,    33,    -1,    35,    23,    24,    25,    -1,
      -1,    -1,    -1,    43,    31,    -1,    33,    -1,    35,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    43,    -1,    -1,    59,
      -1,    61,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      70,    71,    59,    -1,    61,    75,    76,    -1,    -1,    79,
      -1,    -1,    -1,    70,    71,    -1,    -1,    87,    75,    76,
       1,    -1,    79,    -1,    -1,    -1,     7,    -1,    -1,    -1,
      87,    -1,    13,    -1,    -1,    -1,   106,    -1,    -1,   109,
      -1,    -1,    -1,    24,   114,    -1,    -1,    -1,    -1,   106,
      31,    -1,   109,    -1,    35,    -1,    -1,   114,     1,    -1,
      -1,    -1,    -1,    44,    -1,    -1,    -1,    10,    -1,    -1,
      -1,    -1,    -1,    16,    17,    -1,    -1,    -1,    59,    -1,
      61,    62,    25,    26,    -1,    -1,    -1,    30,    -1,    -1,
      33,    -1,    35,    -1,    37,    -1,    -1,    78,    -1,    -1,
      -1,    -1,    -1,    -1,    85,    86,    -1,    88,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    59,    60,    61,   100,
      -1,    -1,    -1,    -1,    -1,     1,    -1,    70,    71,    -1,
      -1,    -1,    75,    -1,    10,    78,    79,    -1,    -1,    -1,
      16,    -1,    85,    86,    87,    -1,    89,    23,    -1,    25,
      26,    -1,    -1,    -1,    30,    -1,    -1,    33,     1,    35,
      -1,    37,    -1,    -1,    -1,    -1,    -1,    10,    -1,    -1,
      -1,    -1,    -1,    16,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    25,    59,    -1,    61,    -1,    30,    -1,    -1,
      33,     1,    35,    -1,    70,    71,    -1,    -1,    -1,    75,
      10,    -1,    78,    79,    -1,    -1,    16,    17,    -1,    85,
      86,    87,    -1,    89,    -1,    25,    59,    -1,    61,    -1,
      -1,    -1,    -1,    33,     1,    35,    -1,    -1,    71,    -1,
      -1,    -1,    75,    10,    -1,    78,    79,    -1,    -1,    16,
      -1,    -1,    85,    86,    87,    -1,    89,    -1,    25,    59,
      -1,    61,    -1,    30,    -1,    -1,    33,     1,    35,    -1,
      -1,    71,    -1,     7,    -1,    75,    -1,    -1,    78,    79,
      -1,    -1,    -1,    -1,    -1,    85,    86,    87,    -1,    89,
      -1,    25,    59,    -1,    61,    -1,    -1,    -1,    -1,    33,
      -1,    35,    -1,    -1,    71,    -1,    -1,    -1,    75,    -1,
      -1,    78,    79,    -1,    -1,    10,    -1,    -1,    85,    86,
      87,    16,    89,    -1,    -1,    59,    -1,    61,    23,    -1,
      25,    26,    -1,    -1,    -1,    30,    70,    -1,    33,    -1,
      35,    75,    -1,    -1,    -1,    79,    -1,    10,    -1,    -1,
      -1,    85,    86,    16,    17,    89,    -1,    -1,    -1,    -1,
      -1,    -1,    25,    26,    59,    -1,    61,    -1,    -1,    -1,
      33,    -1,    35,    -1,    -1,    70,    71,    -1,    -1,    -1,
      75,    -1,    -1,    78,    79,    -1,    -1,    -1,    -1,    -1,
      85,    86,    87,    -1,    89,    -1,    59,    -1,    61,    -1,
      -1,    -1,    -1,    -1,    -1,    10,    -1,    70,    71,    -1,
      -1,    16,    75,    -1,    -1,    78,    79,    -1,    -1,    -1,
      25,    -1,    85,    86,    87,    30,    89,    10,    33,    -1,
      35,    -1,    -1,    16,    -1,    -1,    -1,    -1,    -1,    -1,
      10,    -1,    25,    -1,    -1,    -1,    16,    30,    -1,    -1,
      33,    -1,    35,    -1,    59,    25,    61,    -1,    -1,    -1,
      -1,    -1,    -1,    33,    -1,    35,    71,    -1,    -1,    -1,
      75,    -1,    -1,    78,    79,    -1,    59,    -1,    61,    -1,
      85,    86,    87,    -1,    89,    -1,    -1,    -1,    71,    59,
      -1,    61,    75,    -1,    -1,    78,    79,    -1,    -1,    -1,
      -1,    71,    85,    86,    87,    75,    89,    -1,    78,    79,
      -1,    -1,    -1,    -1,    -1,    85,    86,    87,    -1,    89,
     434,   435,   436,   437,   438,   439,   440,   441,   442,   443,
     444,   445,    -1,    -1,    -1,    -1,    -1,    -1,   452,   453,
     454,   455,   456,   457,   458,   459,   460,   461,   462,   463,
     464,   465,   466,   467,   468,   469,   470,   471,   122,   123,
     124,   125,   126,   127,   128,   129,   130,   131,   132,   133,
     134,   135,   136,    -1,   138,   139,   140,   141
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,     1,     7,    35,    61,    85,    86,    88,   164,   165,
     166,   174,   175,   223,   225,   235,   410,   411,   415,   501,
      30,     6,   167,   501,   503,   501,     0,   174,    13,    24,
      31,    44,    59,    78,   100,   176,   177,   178,   179,   181,
     182,   191,   192,   196,   198,   202,   203,   208,   209,   517,
     522,    35,    42,   412,   151,   414,   415,   228,   226,   501,
     501,   501,   173,   501,     1,    19,   501,   119,   180,   269,
     270,   271,   272,   274,   276,   501,   503,   561,   501,     1,
      37,   189,     1,   194,     1,   200,     1,    37,   205,   207,
     559,     1,   211,   167,     1,   238,    62,   411,   152,    62,
     107,   229,   230,   232,   233,   559,   233,   234,    53,    53,
      42,   149,   152,   501,   501,    42,    25,    70,    79,   562,
     149,   152,   156,   146,   147,   252,   275,   252,   275,   147,
      42,    30,   469,     1,   190,    60,   187,    30,    10,    16,
      17,    23,    25,    26,    33,    34,    35,    70,    71,    75,
      79,    87,    89,   162,   179,   195,   202,   208,   213,   214,
     216,   224,   225,   235,   288,   312,   325,   327,   330,   334,
     337,   340,   344,   345,   471,   485,   495,   496,   522,   523,
     570,    30,    16,    34,    78,    87,   179,   201,   222,   345,
     474,   495,    30,   560,    30,    59,   202,   206,   214,   218,
     225,   327,   330,   340,   344,   345,   471,   495,   496,   522,
     523,    37,   152,   558,    30,    30,   212,   213,   214,   219,
     235,   330,   344,   345,   495,   496,   227,    30,   213,   214,
     220,   235,   236,   239,   330,   344,   345,   495,   496,   147,
     419,   416,   501,   231,   230,   147,   240,    67,   558,   501,
     501,   501,    42,    42,    49,   156,   158,   159,   563,   564,
     565,   566,   569,   272,     4,    11,   167,   273,   505,     1,
       3,     5,    49,    52,    55,    57,   121,   135,   136,   143,
     144,   147,   168,   172,   256,   259,   261,   262,   268,   269,
     271,   272,   277,   278,   279,   280,   287,   315,   322,   502,
     504,   505,    63,   501,    63,   501,   259,   271,    30,   518,
      13,    23,    31,   501,   152,   152,   240,   188,   185,    13,
     193,   501,   335,   501,   503,   501,   360,   361,   501,   173,
      11,    57,   269,   341,   173,    11,    57,   173,   487,   488,
     501,   173,     1,   501,     1,   501,   173,   501,    79,   152,
      24,   199,   501,   501,     1,   269,   480,   118,   501,    30,
      59,   204,   501,   240,   204,    47,   152,    59,   210,   501,
     210,   233,    35,    61,   167,   237,    17,    11,   269,   420,
      42,   417,   240,     1,    25,    33,    35,    59,    61,    70,
      75,    79,    89,   223,   243,   247,   332,   550,   551,   552,
     557,   271,    42,    42,    49,   375,   501,   501,   567,   568,
     375,   156,   151,   159,   501,   568,   148,   271,   279,   148,
     268,   268,   268,   268,   268,   259,   283,   284,   287,   322,
     253,    27,    73,   324,    12,    48,    51,    56,    84,    90,
      12,    48,    51,    56,    84,    90,    91,    92,    93,    94,
      95,    96,   122,   123,   124,   125,   126,   127,   128,   129,
     130,   131,   132,   133,   134,   135,   136,   138,   139,   140,
     141,   260,   145,    63,   146,   271,   317,   148,   149,   153,
     501,   148,   100,   519,   100,   178,   179,   516,   520,   521,
     183,   501,   183,   183,   152,   240,    17,   184,   186,   213,
     214,   215,   235,   327,   330,   340,   344,   345,   495,   496,
     501,   152,   151,   336,    53,   151,    30,    15,    83,    88,
     147,   269,   277,   362,   363,   364,   379,   383,   384,   385,
     386,   394,   398,   404,   410,   428,   458,   501,    42,   470,
     151,   342,   151,   151,    37,    78,   486,   491,   151,    42,
     151,   152,    42,   152,     1,    42,   289,   151,    42,   151,
     173,   501,   152,    30,   478,   173,   199,   501,   152,   152,
     147,   249,    19,   152,   152,    67,     6,   501,   501,   152,
     423,   424,   148,   421,   148,   220,   221,   413,   418,   148,
     501,   503,   553,   501,   501,    79,    35,   241,   173,   501,
     152,   156,   160,   524,   147,   156,   501,   567,   271,   313,
     315,   156,   501,   252,   271,   281,   145,   148,   149,   153,
     285,   148,   149,   254,   259,   262,   262,   262,   262,   262,
     262,   262,   262,   262,   262,   262,   262,   262,   262,   262,
     262,   262,   262,   262,   262,   262,   262,   262,   262,   262,
     262,   262,   262,   262,   262,   262,   262,   268,   135,   136,
     143,   144,   263,   265,   267,   268,   276,   323,   147,   277,
     252,   316,   317,   259,   283,   284,   259,   501,   152,   180,
      30,   521,   152,   360,   469,   313,    42,    11,    57,   167,
     346,   347,   271,   193,   259,   259,   386,   398,   428,   458,
     152,   130,   151,    37,   473,   313,   149,   343,   271,   313,
     501,    47,    24,    31,    55,   118,   489,   492,   152,    60,
     490,   259,    49,   313,   313,   152,     8,    14,    33,    64,
     108,   147,   290,   291,   294,   300,   304,   306,   310,   311,
     317,   506,   511,   152,   313,   147,   500,   501,   503,   151,
      34,   179,   476,   479,   152,   152,    55,   102,   105,   154,
     255,   257,   258,   259,   269,   501,   271,    30,    22,    39,
      52,    67,    80,    83,   394,   425,   426,   427,   428,   433,
     440,   447,   450,   451,   454,   457,   458,   459,   461,   462,
     463,   464,   465,   501,   532,   533,   535,   536,   537,   541,
     544,   546,   149,   422,    17,   107,   147,   555,    42,   555,
     553,   148,   152,   242,   151,   501,    67,   161,   271,   525,
     526,   152,   558,   259,   156,   252,   314,   120,   252,   282,
     268,   283,   259,   155,   286,   256,   265,   265,   268,   268,
     134,   135,   136,   264,   324,   138,   139,   140,   141,   266,
     145,   259,   153,   152,   519,   152,     1,   269,   348,    42,
     524,   152,   152,    66,   430,    68,    38,   395,   397,    18,
      22,    23,    24,    31,    88,   269,   378,   386,   398,   405,
     407,   428,   458,   528,   240,    60,   472,   150,   326,   269,
       9,    42,    55,   338,   249,   271,   269,   173,   491,    30,
      47,     1,   375,    21,    65,   329,   333,   152,   313,   147,
     318,    53,   173,   309,     1,    19,   507,   169,   501,   505,
      76,   150,   331,     1,    13,    23,    24,    25,    31,    33,
      35,    43,    59,    61,    70,    71,    75,    76,    79,    87,
     106,   109,   114,   350,   497,   499,   147,   313,   152,    34,
     474,   475,   477,   481,   482,   197,   259,   250,   153,   237,
       1,   157,   431,   259,   152,   259,   460,    54,   468,   259,
     130,   150,    32,    34,    50,    66,    82,   357,   358,   359,
     449,    22,   269,   394,   428,   461,   465,   546,    81,   152,
     151,   269,   423,   556,   243,    67,    49,   555,   243,    20,
      40,    41,    45,    58,   246,   248,   271,   161,    67,   149,
     527,   152,   148,   148,   259,   287,   265,   263,   267,   268,
     148,   259,   152,   152,   524,   149,   349,   259,   151,   259,
      69,   429,   394,    97,   259,   387,   388,   391,    74,   105,
     110,   396,   365,     1,   259,   386,   398,   428,   458,   380,
     381,   375,   376,   356,   358,    39,   351,   352,   152,   240,
     469,   259,   152,   259,   248,   339,   259,   152,   152,   490,
      34,   249,   152,   524,   150,   328,   271,   303,   313,   321,
     323,    53,   271,   151,   307,    30,     1,   512,    30,   179,
     224,   345,   508,   510,   523,   292,   298,   501,   259,   152,
     152,   154,   498,   148,   149,   493,   494,   501,   505,   331,
     487,   501,    30,   148,   149,   251,   258,   152,    30,   259,
      72,   152,   420,    77,   467,    68,     1,    74,   104,   105,
     110,   111,   388,   391,   543,   259,   453,   501,   463,   501,
     456,   501,   259,   259,    46,   431,   150,   259,    30,   147,
     241,   271,   375,    67,   313,   271,   271,   152,   167,   152,
     350,   259,   152,   130,     9,    52,   392,   152,    81,   389,
     259,    42,   374,    36,    36,    37,    60,   147,   377,    37,
      60,    36,   259,   463,   501,    30,   406,   409,   152,   152,
     152,   259,    42,   152,   152,   558,   259,   152,    63,   301,
     319,   313,   313,    30,   308,   309,   108,   509,    30,    30,
     220,   513,   515,   509,   148,   149,   293,   296,   152,   148,
     152,   497,   148,   149,   152,    78,   484,   491,    34,   255,
      22,   434,   441,   259,    34,   466,   431,   152,    40,    58,
     542,   259,   542,   152,    81,   388,   391,    81,   452,   501,
      40,   151,    81,   455,   429,   423,   259,   259,    28,   152,
     545,   414,   243,   148,    42,   554,   558,   271,    20,    21,
     245,   395,   259,     9,   393,   259,   149,   390,   105,   147,
     373,     1,    81,   529,   530,    47,    47,   501,    47,    47,
      17,   216,   217,   402,    36,   259,    36,   152,   408,   501,
      30,   152,   259,   152,   154,   148,   149,   302,   148,   149,
     320,   152,    64,   501,   108,   514,   514,   169,    30,   297,
     299,   501,   152,   493,   118,   489,   474,   483,   490,   152,
     157,   432,   501,    42,   423,   259,   152,   269,   277,   394,
     549,   259,   105,   152,   259,   152,    81,   259,   152,    40,
     271,   321,   259,   152,   152,    30,   435,   259,    28,   152,
     152,   241,   154,   501,   554,   150,   244,   399,   400,   259,
      28,   391,   259,    37,   371,    30,   284,   463,    30,   529,
     531,   249,   249,   148,   249,   249,    17,   216,   360,   402,
     403,    36,   501,   152,   152,   408,    53,   271,   303,   321,
     305,   501,    19,    76,   295,   133,   173,   152,    30,   152,
     152,    81,   438,   444,   130,   150,    81,   152,    28,   152,
     534,   259,   321,    46,    42,    81,   259,   148,   259,   152,
     388,   401,   387,   148,   240,    60,   369,    36,   153,   284,
      36,   152,   501,    30,    60,   382,   152,   382,   152,   406,
     360,   354,   403,   152,   313,    63,   501,   501,   170,   171,
     504,   152,    34,   284,   436,    28,    29,   442,   445,   104,
     538,   543,   259,   547,   548,   259,   259,   152,   152,   534,
     448,   501,   438,   259,    81,    81,   374,   152,   240,   367,
     408,   403,   153,   408,   152,    36,    47,   152,   152,    28,
      29,   353,   355,   354,   152,   501,   152,   153,    30,   437,
     438,   443,   259,    30,   542,   391,   539,   540,    81,   152,
     545,    81,   152,   152,   436,   259,   284,    37,   372,   152,
      17,   216,   368,   152,   403,   152,   408,   249,    36,   463,
     501,   259,   463,   353,   439,    22,   423,    72,    39,   547,
      81,   284,   152,   259,    30,   149,    47,    60,   370,   360,
     152,   403,    36,    36,   259,   423,   432,   446,   152,   284,
     149,   152,    22,   249,    47,    30,   403,   403,    36,   152,
     423,   149,   152,   547,   432,   152,   249,    18,   403,   539,
     152,   152,   366,   501,   152
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */

#define YYFAIL		goto yyerrlab

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yytoken = YYTRANSLATE (yychar);				\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
#  define YY_LOCATION_PRINT(File, Loc)			\
     fprintf (File, "%d.%d-%d.%d",			\
	      (Loc).first_line, (Loc).first_column,	\
	      (Loc).last_line,  (Loc).last_column)
# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *bottom, yytype_int16 *top)
#else
static void
yy_stack_print (bottom, top)
    yytype_int16 *bottom;
    yytype_int16 *top;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; bottom <= top; ++bottom)
    YYFPRINTF (stderr, " %d", *bottom);
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yyrule)
    YYSTYPE *yyvsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      fprintf (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       		       );
      fprintf (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into YYRESULT an error message about the unexpected token
   YYCHAR while in state YYSTATE.  Return the number of bytes copied,
   including the terminating null byte.  If YYRESULT is null, do not
   copy anything; just return the number of bytes that would be
   copied.  As a special case, return 0 if an ordinary "syntax error"
   message will do.  Return YYSIZE_MAXIMUM if overflow occurs during
   size calculation.  */
static YYSIZE_T
yysyntax_error (char *yyresult, int yystate, int yychar)
{
  int yyn = yypact[yystate];

  if (! (YYPACT_NINF < yyn && yyn <= YYLAST))
    return 0;
  else
    {
      int yytype = YYTRANSLATE (yychar);
      YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
      YYSIZE_T yysize = yysize0;
      YYSIZE_T yysize1;
      int yysize_overflow = 0;
      enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
      char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
      int yyx;

# if 0
      /* This is so xgettext sees the translatable formats that are
	 constructed on the fly.  */
      YY_("syntax error, unexpected %s");
      YY_("syntax error, unexpected %s, expecting %s");
      YY_("syntax error, unexpected %s, expecting %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
# endif
      char *yyfmt;
      char const *yyf;
      static char const yyunexpected[] = "syntax error, unexpected %s";
      static char const yyexpecting[] = ", expecting %s";
      static char const yyor[] = " or %s";
      char yyformat[sizeof yyunexpected
		    + sizeof yyexpecting - 1
		    + ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
		       * (sizeof yyor - 1))];
      char const *yyprefix = yyexpecting;

      /* Start YYX at -YYN if negative to avoid negative indexes in
	 YYCHECK.  */
      int yyxbegin = yyn < 0 ? -yyn : 0;

      /* Stay within bounds of both yycheck and yytname.  */
      int yychecklim = YYLAST - yyn + 1;
      int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
      int yycount = 1;

      yyarg[0] = yytname[yytype];
      yyfmt = yystpcpy (yyformat, yyunexpected);

      for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	  {
	    if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
	      {
		yycount = 1;
		yysize = yysize0;
		yyformat[sizeof yyunexpected - 1] = '\0';
		break;
	      }
	    yyarg[yycount++] = yytname[yyx];
	    yysize1 = yysize + yytnamerr (0, yytname[yyx]);
	    yysize_overflow |= (yysize1 < yysize);
	    yysize = yysize1;
	    yyfmt = yystpcpy (yyfmt, yyprefix);
	    yyprefix = yyor;
	  }

      yyf = YY_(yyformat);
      yysize1 = yysize + yystrlen (yyf);
      yysize_overflow |= (yysize1 < yysize);
      yysize = yysize1;

      if (yysize_overflow)
	return YYSIZE_MAXIMUM;

      if (yyresult)
	{
	  /* Avoid sprintf, as that infringes on the user's name space.
	     Don't have undefined behavior even if the translation
	     produced a string with the wrong number of "%s"s.  */
	  char *yyp = yyresult;
	  int yyi = 0;
	  while ((*yyp = *yyf) != '\0')
	    {
	      if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
		{
		  yyp += yytnamerr (yyp, yyarg[yyi++]);
		  yyf += 2;
		}
	      else
		{
		  yyp++;
		  yyf++;
		}
	    }
	}
      return yysize;
    }
}
#endif /* YYERROR_VERBOSE */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  YYUSE (yyvaluep);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
	break;
    }
}


/* Prevent warnings from -Wmissing-prototypes.  */

#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */



/* The look-ahead symbol.  */
int yychar;

/* The semantic value of the look-ahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;



/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{
  
  int yystate;
  int yyn;
  int yyresult;
  /* Number of tokens to shift before error messages enabled.  */
  int yyerrstatus;
  /* Look-ahead token as an internal (translated) token number.  */
  int yytoken = 0;
#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

  /* Three stacks and their tools:
     `yyss': related to states,
     `yyvs': related to semantic values,
     `yyls': related to locations.

     Refer to the stacks thru separate pointers, to allow yyoverflow
     to reallocate them elsewhere.  */

  /* The state stack.  */
  yytype_int16 yyssa[YYINITDEPTH];
  yytype_int16 *yyss = yyssa;
  yytype_int16 *yyssp;

  /* The semantic value stack.  */
  YYSTYPE yyvsa[YYINITDEPTH];
  YYSTYPE *yyvs = yyvsa;
  YYSTYPE *yyvsp;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  YYSIZE_T yystacksize = YYINITDEPTH;

  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;


  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY;		/* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */

  yyssp = yyss;
  yyvsp = yyvs;


  /* User initialization code.  */

{ yydebug=0; }
/* Line 1078 of yacc.c.  */

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;


	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),

		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss);
	YYSTACK_RELOCATE (yyvs);

#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;


      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     look-ahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to look-ahead token.  */
  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a look-ahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid look-ahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yyn == 0 || yyn == YYTABLE_NINF)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the look-ahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 8:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 9:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 10:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 11:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 12:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 13:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 14:

    { (yyval.qstr)="null"; ;}
    break;

  case 15:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 16:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 17:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+" "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 18:

    { (yyval.qstr)=""; ;}
    break;

  case 19:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 20:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+" "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 21:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 22:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+","+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 35:

    {
                   if ( parse_sec==0 && Config_getBool("SHOW_INCLUDE_FILES") )
                   {
                     addVhdlType((yyvsp[(2) - (3)].qstr),getParsedLine(t_LIBRARY),Entry::VARIABLE_SEC,VhdlDocGen::LIBRARY,(yyvsp[(2) - (3)].qstr).data(),"_library_");
                   }
                   (yyval.qstr)="library "+(yyvsp[(2) - (3)].qstr);
                 ;}
    break;

  case 36:

    {
                   QStringList ql1=QStringList::split(",",(yyvsp[(2) - (3)].qstr),FALSE);
                   for (uint j=0;j<ql1.count();j++)
                   {
                     //QStringList ql=QStringList::split(".",ql1[j],FALSE);
                     QCString it=ql1[j].utf8();
                     if ( parse_sec==0 && Config_getBool("SHOW_INCLUDE_FILES") )
                     {
                       addVhdlType(it,getParsedLine(t_USE),Entry::VARIABLE_SEC,VhdlDocGen::USE,it.data(),"_use_");
                     }
                   }
                   (yyval.qstr)="use "+(yyvsp[(2) - (3)].qstr);
                 ;}
    break;

  case 37:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 38:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+","+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 41:

    {
                (yyval.qstr)=(yyvsp[(2) - (3)].qstr);
                lastEntity=current;
                lastCompound=0;
                 getParsedLine(t_ENTITY);
                addVhdlType((yyval.qstr),getParsedLine(t_ENTITY),Entry::CLASS_SEC,VhdlDocGen::ENTITY,0,0,Public);
               ;}
    break;

  case 49:

    { (yyval.qstr)=""; ;}
    break;

  case 50:

    { currP=VhdlDocGen::PORT; ;}
    break;

  case 51:

    { currP=0; ;}
    break;

  case 52:

    { (yyval.qstr)=""; ;}
    break;

  case 53:

    { currP=VhdlDocGen::GENERIC;parse_sec=GEN_SEC; ;}
    break;

  case 54:

    { currP=0;parse_sec=0; ;}
    break;

  case 55:

    { currP=0; ;}
    break;

  case 56:

    {lastCompound=0;;}
    break;

  case 57:

    {lastCompound=0;;}
    break;

  case 58:

    {
                  (yyval.qstr)=(yyvsp[(4) - (5)].qstr)+"::"+(yyvsp[(2) - (5)].qstr);
                  genLabels.resize(0);
                  pushLabel(genLabels,(yyvsp[(2) - (5)].qstr));
                  lastCompound=current;
                  addVhdlType((yyval.qstr),getParsedLine(t_ARCHITECTURE),Entry::CLASS_SEC,VhdlDocGen::ARCHITECTURE,0,0,Private);
                ;}
    break;

  case 63:

    { (yyval.qstr)=""; ;}
    break;

  case 66:

    { genLabels.resize(0); ;}
    break;

  case 67:

    { genLabels.resize(0); ;}
    break;

  case 68:

    {
                  QCString k=(yyvsp[(3) - (7)].qstr);
                  QCString k2=(yyvsp[(2) - (7)].qstr);        
                  confName="";
                ;}
    break;

  case 69:

    {
                  forL.resize(0);
                  confName=(yyvsp[(2) - (5)].qstr)+"::"+(yyvsp[(4) - (5)].qstr);
                  addVhdlType((yyvsp[(2) - (5)].qstr).data(),getParsedLine(t_CONFIGURATION),Entry::VARIABLE_SEC,VhdlDocGen::CONFIG,"configuration",(yyvsp[(4) - (5)].qstr).data());
                ;}
    break;

  case 70:

    { (yyval.qstr)=""; ;}
    break;

  case 71:

    { 
                  QCString l=(yyvsp[(1) - (1)].qstr);
                  (yyval.qstr)=(yyvsp[(1) - (1)].qstr); 
                ;}
    break;

  case 72:

    { (yyval.qstr)="configuration"; ;}
    break;

  case 73:

    { (yyval.qstr)=(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 74:

    { (yyval.qstr)=""; ;}
    break;

  case 75:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+" "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 76:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 79:

    {
                          lastCompound=current;
                          Entry *clone=new Entry(*current);
                         clone->section=Entry::NAMESPACE_SEC;
                         clone->spec=VhdlDocGen::PACKAGE;
                         clone->name=(yyvsp[(2) - (3)].qstr);
                         clone->startLine=s_str.iLine;
                         clone->bodyLine=s_str.iLine;
                         clone->protection=Package;
                         current_root->addSubEntry(clone);
                         addVhdlType((yyvsp[(2) - (3)].qstr),s_str.iLine,Entry::CLASS_SEC,VhdlDocGen::PACKAGE,0,0,Package);
                       ;}
    break;

  case 81:

    { lastCompound=0; ;}
    break;

  case 82:

    { lastCompound=0; ;}
    break;

  case 83:

    { lastCompound=0; ;}
    break;

  case 92:

    {lastCompound=0;;}
    break;

  case 93:

    {lastCompound=0;;}
    break;

  case 94:

    {
                        (yyval.qstr)=(yyvsp[(3) - (4)].qstr);
                        lastCompound=current;
                        (yyval.qstr).prepend("_");
                        addVhdlType((yyval.qstr),getParsedLine(t_PACKAGE) ,Entry::CLASS_SEC,VhdlDocGen::PACKAGE_BODY,0,0,Protected);
                      ;}
    break;

  case 95:

    { (yyval.qstr)="";lastCompound=0; ;}
    break;

  case 96:

    { lastCompound=0; ;}
    break;

  case 97:

    { lastCompound=0; ;}
    break;

  case 98:

    { lastCompound=0; ;}
    break;

  case 99:

    { (yyval.qstr)=""; ;}
    break;

  case 106:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 107:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 108:

    {  (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 109:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 110:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 111:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 112:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 113:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 114:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 115:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 116:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 117:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 118:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 119:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 120:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 121:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 122:

    { (yyval.qstr)=""; ;}
    break;

  case 134:

    { (yyval.qstr)=""; ;}
    break;

  case 135:

    { (yyval.qstr)=""; ;}
    break;

  case 158:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 159:

    { (yyval.qstr)=""; ;}
    break;

  case 160:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 161:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 162:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 164:

    { (yyval.qstr)=""; ;}
    break;

  case 165:

    { (yyval.qstr)=""; ;}
    break;

  case 166:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 167:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 168:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 169:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 170:

    { (yyval.qstr)=(yyvsp[(3) - (4)].qstr); ;}
    break;

  case 171:

    { (yyval.qstr)="pure"; ;}
    break;

  case 172:

    { (yyval.qstr)="impure"; ;}
    break;

  case 173:

    { currP=0; ;}
    break;

  case 174:

    { 
              currP=VhdlDocGen::PROCEDURE; 
              createFunction((yyvsp[(2) - (2)].qstr),currP,0); 
              tempEntry=current;
             ;}
    break;

  case 175:

    {  newEntry(); ;}
    break;

  case 176:

    {
                currP=VhdlDocGen::FUNCTION;
                createFunction((yyvsp[(1) - (3)].qstr),currP,(yyvsp[(3) - (3)].qstr).data());
              ;}
    break;

  case 177:

    {
                tempEntry=current;
                current->type=(yyvsp[(7) - (7)].qstr);
                newEntry();
              ;}
    break;

  case 178:

    {
                currP=VhdlDocGen::FUNCTION;
                createFunction(0,currP,(yyvsp[(2) - (2)].qstr).data());
              ;}
    break;

  case 179:

    {
                tempEntry=current;
                current->type=(yyvsp[(6) - (6)].qstr);
                newEntry();

              ;}
    break;

  case 182:

    { param_sec=PARAM_SEC; ;}
    break;

  case 183:

    { param_sec= 0; ;}
    break;

  case 184:

    { param_sec=PARAM_SEC; ;}
    break;

  case 185:

    { param_sec= 0; ;}
    break;

  case 191:

    {
      if ((yyvsp[(3) - (3)].qstr).data())
      {
        FlowChart::addFlowChart(FlowChart::VARIABLE_NO,(yyvsp[(3) - (3)].qstr),0);
      }
      FlowChart::addFlowChart(FlowChart::BEGIN_NO,"BEGIN",0);
    ;}
    break;

  case 192:

    {
      tempEntry->endBodyLine=s_str.yyLineNr;
      createFlow();    
      currP=0;
    ;}
    break;

  case 193:

    {
      currP=0;
    ;}
    break;

  case 201:

    { (yyval.qstr)=""; ;}
    break;

  case 202:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 203:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 204:

    { (yyval.qstr)=""; ;}
    break;

  case 205:

    { (yyval.qstr)=""; ;}
    break;

  case 209:

    {
                    // adding generic :  [ package foo  is new bar]
                    if (parse_sec==GEN_SEC)
                    {
                       addVhdlType(current->name.data(),getParsedLine(t_PACKAGE),Entry::VARIABLE_SEC,VhdlDocGen::GENERIC,(yyvsp[(1) - (1)].qstr).data(),0);
                    }
                  ;}
    break;

  case 210:

    {
                    if (parse_sec==GEN_SEC)
                    {
                      int a=getParsedLine(t_FUNCTION);
                      int b=getParsedLine(t_PROCEDURE);

                      if (a>b) b=a;

                      addVhdlType(current->name.data(),b,Entry::VARIABLE_SEC,VhdlDocGen::GENERIC,(yyvsp[(1) - (1)].qstr).data(),0);
                    }
                  ;}
    break;

  case 211:

    {
                    if (parse_sec==GEN_SEC)
                    {
                        addVhdlType((yyvsp[(2) - (2)].qstr),s_str.iLine,Entry::VARIABLE_SEC,currP,(yyvsp[(1) - (2)].qstr).data(),0);
                    }
                  ;}
    break;

  case 212:

    {
                    (yyval.qstr)=(yyvsp[(2) - (7)].qstr)+":"+(yyvsp[(4) - (7)].qstr)+(yyvsp[(5) - (7)].qstr)+(yyvsp[(6) - (7)].qstr)+(yyvsp[(7) - (7)].qstr);
                    if (currP!=VhdlDocGen::COMPONENT)
                    {
                      if (currP==VhdlDocGen::FUNCTION || currP==VhdlDocGen::PROCEDURE)
                      {
                        addProto((yyvsp[(1) - (7)].qstr).data(),(yyvsp[(2) - (7)].qstr).data(),(yyvsp[(4) - (7)].qstr).data(),(yyvsp[(5) - (7)].qstr).data(),(yyvsp[(6) - (7)].qstr).data(),(yyvsp[(7) - (7)].qstr).data());
                      }
                      else
                      {
                        QCString i=(yyvsp[(5) - (7)].qstr)+(yyvsp[(6) - (7)].qstr)+(yyvsp[(7) - (7)].qstr);
                        if (currP==VhdlDocGen::GENERIC)
                          addVhdlType((yyvsp[(2) - (7)].qstr),s_str.iLine,Entry::VARIABLE_SEC,currP,i.data(),(yyvsp[(4) - (7)].qstr).data());
                        else if(parse_sec != GEN_SEC)
                          addVhdlType((yyvsp[(2) - (7)].qstr),s_str.iLine,Entry::VARIABLE_SEC,currP,i.data(),(yyvsp[(4) - (7)].qstr).data());
                      }
                      //   fprintf(stderr,"\n\n <<port  %s  >>\n",$$.data());
                    } // if component
                  ;}
    break;

  case 213:

    { (yyval.qstr)=""; ;}
    break;

  case 214:

    { (yyval.qstr)=":="+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 215:

    { (yyval.qstr)=""; ;}
    break;

  case 216:

    { (yyval.qstr)="buffer"; ;}
    break;

  case 217:

    { (yyval.qstr)="bus"; ;}
    break;

  case 218:

    { (yyval.qstr)=""; ;}
    break;

  case 219:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 220:

    { (yyval.qstr)=""; ;}
    break;

  case 221:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 222:

    { (yyval.qstr)="in"; ;}
    break;

  case 223:

    { (yyval.qstr)="out"; ;}
    break;

  case 224:

    { (yyval.qstr)="inout"; ;}
    break;

  case 225:

    { (yyval.qstr)="buffer"; ;}
    break;

  case 226:

    { (yyval.qstr)="link"; ;}
    break;

  case 227:

    { (yyval.qstr)="("+(yyvsp[(2) - (4)].qstr)+")"; ;}
    break;

  case 228:

    { (yyval.qstr)=""; ;}
    break;

  case 229:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+" "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 230:

    { (yyval.qstr)=", "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 231:

    {
      QCString str="( "+(yyvsp[(2) - (4)].qstr)+(yyvsp[(3) - (4)].qstr);
      str.append(" )");
      (yyval.qstr)=str;
    ;}
    break;

  case 232:

    { (yyval.qstr)=""; ;}
    break;

  case 233:

    { (yyval.qstr)=" ( open ) "; ;}
    break;

  case 234:

    { (yyval.qstr)=""; ;}
    break;

  case 235:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+" "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 236:

    { (yyval.qstr)=","+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 237:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+"=>"+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 238:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 239:

    { (yyval.qstr)="<>"; ;}
    break;

  case 240:

    { (yyval.qstr)="default"; ;}
    break;

  case 241:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 242:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+"=>"+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 243:

    {  (yyval.qstr)=(yyvsp[(1) - (1)].qstr) ; ;}
    break;

  case 244:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 245:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 246:

    { (yyval.qstr)="open"; ;}
    break;

  case 247:

    { (yyval.qstr)="inertial"; ;}
    break;

  case 248:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 249:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 250:

    { (yyval.qstr)="sll"; ;}
    break;

  case 251:

    { (yyval.qstr)="sra"; ;}
    break;

  case 252:

    { (yyval.qstr)="sla"; ;}
    break;

  case 253:

    { (yyval.qstr)="srl"; ;}
    break;

  case 254:

    { (yyval.qstr)="ror"; ;}
    break;

  case 255:

    { (yyval.qstr)="rol"; ;}
    break;

  case 256:

    { (yyval.qstr)= (yyvsp[(1) - (3)].qstr)+(yyvsp[(2) - (3)].qstr)+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 257:

    { (yyval.qstr)= (yyvsp[(1) - (3)].qstr)+" and "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 258:

    { (yyval.qstr)= (yyvsp[(1) - (3)].qstr)+" xor "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 259:

    { (yyval.qstr)= (yyvsp[(1) - (3)].qstr)+" or "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 260:

    { (yyval.qstr)= (yyvsp[(1) - (3)].qstr)+" nor "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 261:

    { (yyval.qstr)= (yyvsp[(1) - (3)].qstr)+"xnor"+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 262:

    { (yyval.qstr)= (yyvsp[(1) - (3)].qstr)+"nand"+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 263:

    { (yyval.qstr)= (yyvsp[(1) - (3)].qstr)+"nand"+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 264:

    { (yyval.qstr)= (yyvsp[(1) - (3)].qstr)+"nor"+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 265:

    { (yyval.qstr)= (yyvsp[(1) - (3)].qstr)+"nand"+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 266:

    { (yyval.qstr)= (yyvsp[(1) - (3)].qstr)+" and "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 267:

    { (yyval.qstr)= (yyvsp[(1) - (3)].qstr)+" or "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 268:

    { (yyval.qstr)= (yyvsp[(1) - (3)].qstr)+" xor "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 269:

    { (yyval.qstr)=" ?? "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 270:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 271:

    { (yyval.qstr)="+"+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 272:

    { (yyval.qstr)="-"+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 273:

    { (yyval.qstr)="abs"+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 274:

    { (yyval.qstr)="not "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 275:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+" ** "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 276:

    { (yyval.qstr)=(yyvsp[(2) - (4)].qstr)+" ** "+(yyvsp[(4) - (4)].qstr); ;}
    break;

  case 277:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+" mod "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 278:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+" rem "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 279:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+" & "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 280:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+" * "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 281:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+" + "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 282:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+" - "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 283:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+" <= "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 284:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+" >= "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 285:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+" < "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 286:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+" > "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 287:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+" = "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 288:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+" != "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 289:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+" / "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 290:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+" ?/= "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 291:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+" ?= "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 292:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+" ?< "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 293:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+" ?> "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 294:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+" ?<= "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 295:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+" ?>= "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 296:

    { (yyval.qstr) = "-"+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 297:

    { (yyval.qstr) = "+"+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 298:

    { (yyval.qstr) = (yyvsp[(1) - (1)].qstr); ;}
    break;

  case 299:

    { (yyval.qstr) = (yyvsp[(1) - (3)].qstr)+" "+(yyvsp[(2) - (3)].qstr)+" "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 300:

    { (yyval.qstr) = "&"; ;}
    break;

  case 301:

    { (yyval.qstr) = "-"; ;}
    break;

  case 302:

    { (yyval.qstr) = "+"; ;}
    break;

  case 303:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 304:

    { (yyval.qstr) = (yyvsp[(1) - (3)].qstr)+" "+(yyvsp[(2) - (3)].qstr)+" "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 305:

    { (yyval.qstr) = "*";   ;}
    break;

  case 306:

    { (yyval.qstr) = "rem"; ;}
    break;

  case 307:

    { (yyval.qstr) = "mod"; ;}
    break;

  case 308:

    { (yyval.qstr) = "/";   ;}
    break;

  case 309:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 310:

    { (yyval.qstr)="abs "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 311:

    { (yyval.qstr)="not  "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 312:

    { (yyval.qstr) = (yyvsp[(1) - (3)].qstr)+" ** "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 313:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 314:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 315:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 316:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 317:

    { (yyval.qstr)=""; ;}
    break;

  case 318:

    { (yyval.qstr)="("+(yyvsp[(2) - (3)].qstr)+")"; ;}
    break;

  case 319:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 320:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 321:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 322:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 323:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 324:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 325:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 326:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 327:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+"."+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 328:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 329:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 330:

    { (yyval.qstr)="all"; ;}
    break;

  case 331:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+" "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 332:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+" "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 333:

    { (yyval.qstr)="'"; ;}
    break;

  case 334:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+"' "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 336:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+" '"+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 337:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+"' range "; ;}
    break;

  case 338:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+"' range "; ;}
    break;

  case 339:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+" ) "; ;}
    break;

  case 340:

    { (yyval.qstr)="( "+(yyvsp[(2) - (5)].qstr)+ "=>"+(yyvsp[(4) - (5)].qstr)+" ) "; ;}
    break;

  case 341:

    { (yyval.qstr)=" ( "+(yyvsp[(2) - (4)].qstr)+","+(yyvsp[(4) - (4)].qstr); ;}
    break;

  case 342:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+","+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 343:

    { (yyval.qstr)=(yyvsp[(1) - (5)].qstr)+"'("+(yyvsp[(4) - (5)].qstr)+" ) "; ;}
    break;

  case 344:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+"'"+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 352:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+"=> "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 353:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 354:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+" "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 355:

    { (yyval.qstr)="";        ;}
    break;

  case 356:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+" "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 357:

    { (yyval.qstr)=" | "+(yyvsp[(2) - (2)].qstr);  ;}
    break;

  case 358:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 359:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 360:

    { (yyval.qstr)="others"; ;}
    break;

  case 361:

    { (yyval.qstr)=""; ;}
    break;

  case 362:

    {
             addVhdlType((yyvsp[(2) - (4)].qstr),getParsedLine(t_TYPE),Entry::VARIABLE_SEC,VhdlDocGen::TYPE,0,(yyvsp[(3) - (4)].qstr).data());
            (yyval.qstr)="type ";
            (yyval.qstr)+=(yyvsp[(2) - (4)].qstr)+(yyvsp[(3) - (4)].qstr)+";";
           ;}
    break;

  case 363:

    { (yyval.qstr)=""; ;}
    break;

  case 364:

    { (yyval.qstr)=""; ;}
    break;

  case 365:

    { (yyval.qstr)=" is "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 366:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 367:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 368:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 369:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 370:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 371:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 372:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 373:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 374:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 375:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 376:

    { (yyval.qstr)="( "+(yyvsp[(2) - (4)].qstr)+" "+(yyvsp[(3) - (4)].qstr)+" )"; ;}
    break;

  case 377:

    { (yyval.qstr)=""; ;}
    break;

  case 378:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+" "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 379:

    { (yyval.qstr)=","+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 380:

    {
                             (yyval.qstr)=(yyvsp[(1) - (6)].qstr);
                             current->args=(yyvsp[(3) - (6)].qstr)+"#"+(yyvsp[(4) - (6)].qstr);
                             current->args.prepend("units");
                             current->spec=VhdlDocGen::UNITS;
                           ;}
    break;

  case 383:

    { (yyval.qstr)=""; ;}
    break;

  case 384:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+" "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 385:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr)+"#"; ;}
    break;

  case 386:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr); ;}
    break;

  case 387:

    { (yyval.qstr)=(yyvsp[(1) - (4)].qstr)+"="+(yyvsp[(3) - (4)].qstr); ;}
    break;

  case 388:

    {
      QCString sr1=" array ( "+(yyvsp[(3) - (7)].qstr)+" "+(yyvsp[(4) - (7)].qstr);
      QCString sr2=" ) of "+(yyvsp[(7) - (7)].qstr);
      (yyval.qstr)=sr1+sr2;
    ;}
    break;

  case 389:

    { (yyval.qstr)=""; ;}
    break;

  case 390:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+"  "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 391:

    { (yyval.qstr)=", "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 392:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+" range<> "; ;}
    break;

  case 393:

    { (yyval.qstr)=" array "+(yyvsp[(2) - (4)].qstr)+" of "+(yyvsp[(4) - (4)].qstr); ;}
    break;

  case 394:

    { (yyval.qstr)=""; ;}
    break;

  case 395:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 396:

    {
      QRegExp reg("[\\s]");
      QCString oo=(yyvsp[(2) - (6)].qstr)+" "+(yyvsp[(3) - (6)].qstr);
      current->spec=VhdlDocGen::RECORD;
      current->args=oo;
      current->args.replace(reg,"%");
      current->args.prepend("record");
      (yyval.qstr)=(yyvsp[(2) - (6)].qstr)+" "+(yyvsp[(3) - (6)].qstr);
    ;}
    break;

  case 397:

    { (yyval.qstr)=""; ;}
    break;

  case 398:

    {
      (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+" "+(yyvsp[(2) - (2)].qstr);
    ;}
    break;

  case 399:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 400:

    { (yyval.qstr)=(yyvsp[(1) - (4)].qstr)+":"+(yyvsp[(3) - (4)].qstr)+"#"; ;}
    break;

  case 401:

    { (yyval.qstr)="access "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 402:

    { (yyval.qstr)="file of "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 403:

    {
      addVhdlType((yyvsp[(2) - (5)].qstr),getParsedLine(t_SUBTYPE),Entry::VARIABLE_SEC,VhdlDocGen::SUBTYPE,0,(yyvsp[(4) - (5)].qstr).data());
    ;}
    break;

  case 404:

    { (yyval.qstr)=""; ;}
    break;

  case 405:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+" "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 406:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 407:

    { (yyval.qstr)=""; ;}
    break;

  case 408:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 409:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+" "+(yyvsp[(2) - (3)].qstr)+" "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 410:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+" "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 411:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+" "+(yyvsp[(2) - (3)].qstr)+" "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 412:

    { (yyval.qstr)=""; ;}
    break;

  case 413:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 414:

    { (yyval.qstr)="range "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 415:

    { (yyval.qstr)="("+(yyvsp[(2) - (4)].qstr)+" "+(yyvsp[(3) - (4)].qstr)+")"; ;}
    break;

  case 416:

    { (yyval.qstr)=""; ;}
    break;

  case 417:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+" "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 418:

    { (yyval.qstr)=","+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 419:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 420:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 421:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 422:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+"  "+(yyvsp[(2) - (3)].qstr)+"  "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 423:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 424:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+"  "+(yyvsp[(2) - (3)].qstr)+"  "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 425:

    { (yyval.qstr)=" to "; ;}
    break;

  case 426:

    { (yyval.qstr)=" downto "; ;}
    break;

  case 427:

    {
                                    QCString it=(yyvsp[(4) - (6)].qstr)+" "+(yyvsp[(5) - (6)].qstr);
                                    //  fprintf(stderr,"\n currP %d \n",currP);
                                    addVhdlType((yyvsp[(2) - (6)].qstr),getParsedLine(t_CONSTANT),Entry::VARIABLE_SEC,VhdlDocGen::CONSTANT,0,it.data());
                                    (yyval.qstr)="constant "+(yyvsp[(2) - (6)].qstr);
                                    (yyval.qstr)+=": ";
                                    (yyval.qstr)+=it+";";
                                  ;}
    break;

  case 428:

    { (yyval.qstr)="";      ;}
    break;

  case 429:

    { (yyval.qstr)=":="+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 430:

    {
                                    QCString s=(yyvsp[(4) - (7)].qstr)+" "+(yyvsp[(6) - (7)].qstr);
                                    addVhdlType((yyvsp[(2) - (7)].qstr),getParsedLine(t_SIGNAL),Entry::VARIABLE_SEC,VhdlDocGen::SIGNAL,0,s.data());
                                  ;}
    break;

  case 431:

    { (yyval.qstr)=""; ;}
    break;

  case 432:

    { (yyval.qstr)=":="+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 433:

    { (yyval.qstr)=""; ;}
    break;

  case 434:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 435:

    {
                                    (yyval.qstr)=(yyvsp[(2) - (6)].qstr)+":"+(yyvsp[(4) - (6)].qstr)+" "+(yyvsp[(5) - (6)].qstr)+";";
                                    (yyval.qstr).prepend("variable: ");
                                  ;}
    break;

  case 436:

    {
                                    (yyval.qstr)=(yyvsp[(5) - (7)].qstr)+" "+(yyvsp[(6) - (7)].qstr);
                                    addVhdlType((yyvsp[(3) - (7)].qstr),getParsedLine(t_VARIABLE),Entry::VARIABLE_SEC,VhdlDocGen::SHAREDVARIABLE,0,(yyval.qstr).data());
                                  ;}
    break;

  case 437:

    { (yyval.qstr)=""; ;}
    break;

  case 438:

    { (yyval.qstr)=":="+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 439:

    { (yyval.qstr)="constant"; ;}
    break;

  case 440:

    { (yyval.qstr)="signal"; ;}
    break;

  case 441:

    { (yyval.qstr)="variable"; ;}
    break;

  case 442:

    { (yyval.qstr)="shared"; ;}
    break;

  case 443:

    { (yyval.qstr)="file"; ;}
    break;

  case 444:

    { (yyval.qstr)="type"; ;}
    break;

  case 445:

    { (yyval.qstr)="bus"; ;}
    break;

  case 446:

    { (yyval.qstr)="register"; ;}
    break;

  case 447:

    {
                                    QCString s=(yyvsp[(3) - (7)].qstr)+" is "+(yyvsp[(5) - (7)].qstr)+(yyvsp[(6) - (7)].qstr);
                                    addVhdlType((yyvsp[(2) - (7)].qstr),getParsedLine(t_ALIAS),Entry::VARIABLE_SEC,VhdlDocGen::ALIAS,0,s.data());
                                   (yyval.qstr)="alias "+(yyvsp[(2) - (7)].qstr);
                                   (yyval.qstr)+=": ";
                                   (yyval.qstr)+=s+";";
                                  ;}
    break;

  case 448:

    { (yyval.qstr)=""; ;}
    break;

  case 449:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 450:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 451:

    { (yyval.qstr)=""; ;}
    break;

  case 452:

    { (yyval.qstr)=(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 453:

    {
             addVhdlType((yyvsp[(2) - (8)].qstr),getParsedLine(t_FILE),Entry::VARIABLE_SEC,VhdlDocGen::VFILE,0,(yyvsp[(4) - (8)].qstr).data());
           ;}
    break;

  case 454:

    {
             QCString s=(yyvsp[(4) - (6)].qstr)+" "+(yyvsp[(5) - (6)].qstr);
             addVhdlType((yyvsp[(2) - (6)].qstr),getParsedLine(t_FILE),Entry::VARIABLE_SEC,VhdlDocGen::VFILE,0,s.data());
           ;}
    break;

  case 455:

    { (yyval.qstr)=""; ;}
    break;

  case 456:

    { (yyval.qstr)="open "+(yyvsp[(2) - (4)].qstr)+" is "+s_str.qstr; ;}
    break;

  case 457:

    { (yyval.qstr)=""; ;}
    break;

  case 458:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 459:

    { (yyval.qstr)="disconnect "+(yyvsp[(2) - (7)].qstr)+":"+(yyvsp[(4) - (7)].qstr)+" after "+(yyvsp[(6) - (7)].qstr); ;}
    break;

  case 460:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 461:

    { (yyval.qstr)="others"; ;}
    break;

  case 462:

    { (yyval.qstr)="all"; ;}
    break;

  case 463:

    { (yyval.qstr)=""; ;}
    break;

  case 464:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 465:

    { (yyval.qstr)=" , "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 466:

    {
                  addVhdlType((yyvsp[(2) - (5)].qstr),getParsedLine(t_ATTRIBUTE),Entry::VARIABLE_SEC,VhdlDocGen::ATTRIBUTE,0,(yyvsp[(4) - (5)].qstr).data());
                 (yyval.qstr)= "attribute "+(yyvsp[(2) - (5)].qstr)+ " : "+(yyvsp[(4) - (5)].qstr);
                ;}
    break;

  case 467:

    {
                  QCString att=(yyvsp[(4) - (7)].qstr)+" is "+(yyvsp[(6) - (7)].qstr);
                  addVhdlType((yyvsp[(2) - (7)].qstr),getParsedLine(t_ATTRIBUTE),Entry::VARIABLE_SEC,VhdlDocGen::ATTRIBUTE,0,att.data());
                  (yyval.qstr)="attribute "+att+";";
                ;}
    break;

  case 468:

    { (yyval.qstr)=(yyvsp[(1) - (4)].qstr)+(yyvsp[(2) - (4)].qstr)+":"+(yyvsp[(4) - (4)].qstr); ;}
    break;

  case 469:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+" "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 470:

    { (yyval.qstr)="others";  ;}
    break;

  case 471:

    { (yyval.qstr)="all";     ;}
    break;

  case 472:

    { (yyval.qstr)="";        ;}
    break;

  case 473:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+" "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 474:

    { (yyval.qstr)=","+(yyvsp[(2) - (2)].qstr);    ;}
    break;

  case 475:

    { (yyval.qstr)="entity";        ;}
    break;

  case 476:

    { (yyval.qstr)="architecture";  ;}
    break;

  case 477:

    { (yyval.qstr)="package";       ;}
    break;

  case 478:

    { (yyval.qstr)="configuration"; ;}
    break;

  case 479:

    { (yyval.qstr)="component";     ;}
    break;

  case 480:

    { (yyval.qstr)="label";         ;}
    break;

  case 481:

    { (yyval.qstr)="type";          ;}
    break;

  case 482:

    { (yyval.qstr)="subtype";       ;}
    break;

  case 483:

    { (yyval.qstr)="procedure";     ;}
    break;

  case 484:

    { (yyval.qstr)="function";              ;}
    break;

  case 485:

    { (yyval.qstr)="signal";        ;}
    break;

  case 486:

    { (yyval.qstr)="variable";      ;}
    break;

  case 487:

    { (yyval.qstr)="constant";      ;}
    break;

  case 488:

    { (yyval.qstr)="group";         ;}
    break;

  case 489:

    { (yyval.qstr)="file";          ;}
    break;

  case 490:

    { (yyval.qstr)="units";         ;}
    break;

  case 491:

    { (yyval.qstr)="literal";       ;}
    break;

  case 492:

    { (yyval.qstr)="sequence";      ;}
    break;

  case 493:

    { (yyval.qstr)="property";      ;}
    break;

  case 494:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 495:

    { (yyval.qstr)=""; ;}
    break;

  case 496:

    { (yyval.qstr)=""; ;}
    break;

  case 497:

    { (yyval.qstr)=""; ;}
    break;

  case 498:

    { (yyval.qstr)="else generate "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 499:

    { (yyval.qstr)="else "+(yyvsp[(2) - (4)].qstr)+" generate "+(yyvsp[(4) - (4)].qstr); ;}
    break;

  case 500:

    { (yyval.qstr)=""; ;}
    break;

  case 501:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 502:

    { (yyval.qstr)="elsif "+(yyvsp[(2) - (4)].qstr)+" generate "+(yyvsp[(4) - (4)].qstr); ;}
    break;

  case 503:

    { (yyval.qstr)="elsif "+(yyvsp[(2) - (5)].qstr)+(yyvsp[(3) - (5)].qstr)+" generate "+(yyvsp[(5) - (5)].qstr); ;}
    break;

  case 504:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 505:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 506:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 507:

    {
    if (!lab.isEmpty())
    {
      (yyval.qstr)=lab+" :for "+(yyvsp[(2) - (4)].qstr)+" in "+(yyvsp[(4) - (4)].qstr);
    }
    else
    {
      (yyval.qstr)=" for "+(yyvsp[(2) - (4)].qstr)+" in "+(yyvsp[(4) - (4)].qstr);
    }
    FlowChart::addFlowChart(FlowChart::FOR_NO,0,(yyval.qstr),lab.data());
    lab.resize(0);
  ;}
    break;

  case 508:

    {
    (yyval.qstr)=lab+" for "+(yyvsp[(2) - (5)].qstr)+(yyvsp[(3) - (5)].qstr)+" in "+(yyvsp[(5) - (5)].qstr);
    FlowChart::addFlowChart(FlowChart::FOR_NO,0,(yyval.qstr),lab.data());
    lab="";
  ;}
    break;

  case 509:

    {
                             (yyval.qstr)=" while "+(yyvsp[(2) - (2)].qstr);
                             FlowChart::addFlowChart(FlowChart::WHILE_NO,0,(yyval.qstr),lab.data());
                             lab="";
                           ;}
    break;

  case 510:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 511:

    { (yyval.qstr)=""; ;}
    break;

  case 512:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 513:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 514:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 515:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 516:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 517:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 518:

    {
                                              QCString li=(yyvsp[(1) - (1)].qstr);
                                              (yyval.qstr)=(yyvsp[(1) - (1)].qstr);
                                            ;}
    break;

  case 519:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 521:

    { pushLabel(genLabels,(yyvsp[(1) - (3)].qstr)); ;}
    break;

  case 522:

    {
              (yyval.qstr)=(yyvsp[(1) - (15)].qstr)+":block"; //+$4+$5+$6+$7+$8+"begin "+$10+" block "+$13;
              genLabels=popLabel(genLabels);
            ;}
    break;

  case 523:

    { (yyval.qstr)=""; ;}
    break;

  case 524:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 525:

    { (yyval.qstr)=""; ;}
    break;

  case 526:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 527:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 528:

    { (yyval.qstr)=""; ;}
    break;

  case 529:

    { (yyval.qstr)="port "+(yyvsp[(2) - (4)].qstr)+";"+(yyvsp[(4) - (4)].qstr); ;}
    break;

  case 530:

    { (yyval.qstr)="port map "+(yyvsp[(3) - (4)].qstr); ;}
    break;

  case 531:

    { (yyval.qstr)=""; ;}
    break;

  case 532:

    { (yyval.qstr)="generic "+(yyvsp[(2) - (4)].qstr)+";"+(yyvsp[(4) - (4)].qstr); ;}
    break;

  case 533:

    { (yyval.qstr)=""; ;}
    break;

  case 534:

    { (yyval.qstr)="generic map "+(yyvsp[(3) - (4)].qstr); ;}
    break;

  case 535:

    { (yyval.qstr)=""; ;}
    break;

  case 536:

    { (yyval.qstr)="("+(yyvsp[(2) - (4)].qstr)+")"+(yyvsp[(4) - (4)].qstr); ;}
    break;

  case 537:

    { (yyval.qstr)=""; ;}
    break;

  case 538:

    { (yyval.qstr)=" is "; ;}
    break;

  case 539:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 540:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+"."+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 541:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+" "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 542:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 543:

    { (yyval.qstr)="("+(yyvsp[(2) - (3)].qstr)+")"; ;}
    break;

  case 544:

    { (yyval.qstr)="configurátion";yyLineNr=s_str.iLine; ;}
    break;

  case 545:

    { (yyval.qstr)="entity";yyLineNr=s_str.iLine; ;}
    break;

  case 546:

    { (yyval.qstr)="component";yyLineNr=s_str.iLine; ;}
    break;

  case 547:

    { yyLineNr=s_str.iLine; ;}
    break;

  case 548:

    {
                                 addCompInst((yyvsp[(1) - (9)].qstr).lower().data(),(yyvsp[(3) - (9)].qstr).lower().data(),0,yyLineNr);(yyval.qstr)="";
                               ;}
    break;

  case 549:

    { yyLineNr=s_str.iLine; ;}
    break;

  case 550:

    {
                                 addCompInst((yyvsp[(1) - (8)].qstr).lower().data(),(yyvsp[(3) - (8)].qstr).lower().data(),0,yyLineNr);(yyval.qstr)="222";
                               ;}
    break;

  case 551:

    {
                                 addCompInst((yyvsp[(1) - (8)].qstr).lower().data(),(yyvsp[(4) - (8)].qstr).lower().data(),(yyvsp[(3) - (8)].qstr).data(),yyLineNr);(yyval.qstr)="";
                               ;}
    break;

  case 552:

    {
                                 addCompInst((yyvsp[(1) - (9)].qstr).lower().data(),(yyvsp[(4) - (9)].qstr).lower().data(),(yyvsp[(3) - (9)].qstr).lower().data(),yyLineNr);(yyval.qstr)="";
                               ;}
    break;

  case 555:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+":"+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 556:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 557:

    { (yyval.qstr)=(yyvsp[(1) - (4)].qstr)+":"+"postponed "+(yyvsp[(4) - (4)].qstr); ;}
    break;

  case 558:

    { (yyval.qstr)="postponed "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 559:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+":"+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 560:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 561:

    { (yyval.qstr)=(yyvsp[(1) - (4)].qstr)+":"+"postponed "+(yyvsp[(4) - (4)].qstr); ;}
    break;

  case 562:

    { (yyval.qstr)="postponed "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 563:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+":"+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 564:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 565:

    { (yyval.qstr)=(yyvsp[(1) - (4)].qstr)+":"+"postponed "+(yyvsp[(4) - (4)].qstr); ;}
    break;

  case 566:

    { (yyval.qstr)="postponed "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 567:

    { (yyval.qstr)=(yyvsp[(1) - (4)].qstr)+":"+"postponed "+(yyvsp[(4) - (4)].qstr); ;}
    break;

  case 568:

    { (yyval.qstr)="postponed "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 569:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+":"+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 570:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 571:

    { (yyval.qstr)=(yyvsp[(1) - (5)].qstr)+"<="+(yyvsp[(3) - (5)].qstr)+(yyvsp[(4) - (5)].qstr); ;}
    break;

  case 572:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 573:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+" when "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 574:

    { (yyval.qstr)=(yyvsp[(1) - (5)].qstr)+" when "+(yyvsp[(3) - (5)].qstr)+"else"+(yyvsp[(5) - (5)].qstr); ;}
    break;

  case 575:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 576:

    { (yyval.qstr)="unaffected"; ;}
    break;

  case 577:

    { (yyval.qstr)=""; ;}
    break;

  case 578:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 579:

    { (yyval.qstr)=","+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 580:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 581:

    { (yyval.qstr)=""; ;}
    break;

  case 582:

    { (yyval.qstr)="after "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 583:

    { (yyval.qstr)=" null "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 584:

    { (yyval.qstr)=" null "; ;}
    break;

  case 585:

    { (yyval.qstr)="after "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 586:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 587:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 588:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 589:

    { (yyval.qstr)=""; ;}
    break;

  case 590:

    { (yyval.qstr)="transport "; ;}
    break;

  case 591:

    { (yyval.qstr)="transport"+(yyvsp[(2) - (3)].qstr)+" intertial "; ;}
    break;

  case 592:

    { (yyval.qstr)=" intertial "; ;}
    break;

  case 593:

    { (yyval.qstr)=""; ;}
    break;

  case 594:

    { (yyval.qstr)=" guarded "; ;}
    break;

  case 595:

    { (yyval.qstr)="with "+(yyvsp[(2) - (8)].qstr)+" select "+(yyvsp[(4) - (8)].qstr)+"<="+(yyvsp[(6) - (8)].qstr)+(yyvsp[(7) - (8)].qstr); ;}
    break;

  case 596:

    { (yyval.qstr)=(yyvsp[(1) - (4)].qstr)+(yyvsp[(2) - (4)].qstr); ;}
    break;

  case 597:

    { (yyval.qstr)=""; ;}
    break;

  case 598:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 599:

    { (yyval.qstr)=(yyvsp[(1) - (4)].qstr)+" when "+(yyvsp[(3) - (4)].qstr); ;}
    break;

  case 600:

    { (yyval.qstr)=""; ;}
    break;

  case 601:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+" begin "; ;}
    break;

  case 602:

    { (yyval.qstr)="begin "; ;}
    break;

  case 604:

    { pushLabel(genLabels,(yyvsp[(1) - (2)].qstr)); ;}
    break;

  case 606:

    { genLabels=popLabel(genLabels); ;}
    break;

  case 607:

    {genLabels=popLabel(genLabels); ;}
    break;

  case 608:

    { pushLabel(genLabels,(yyvsp[(1) - (2)].qstr)); ;}
    break;

  case 611:

    { (yyval.qstr)=""; ;}
    break;

  case 612:

    { (yyval.qstr)=(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 613:

    { (yyval.qstr)="end"; ;}
    break;

  case 614:

    { (yyval.qstr)="end "+(yyvsp[(2) - (3)].qstr); ;}
    break;

  case 615:

    {  
                 current->name=(yyvsp[(1) - (3)].qstr);
                 tempEntry=current;
                 current->endBodyLine=s_str.yyLineNr;
                 newEntry();
                 currName=(yyvsp[(1) - (3)].qstr);
               ;}
    break;

  case 616:

    {
                 current->name=VhdlDocGen::getProcessNumber();
                 current->endBodyLine=s_str.yyLineNr;
                 tempEntry=current;
                 newEntry();
               ;}
    break;

  case 617:

    {  
               currP=VhdlDocGen::PROCESS; 
               current->startLine=s_str.yyLineNr;
               current->bodyLine=s_str.yyLineNr;
               ;}
    break;

  case 618:

    {
                 if ((yyvsp[(5) - (5)].qstr).data())
                  FlowChart::addFlowChart(FlowChart::VARIABLE_NO,(yyvsp[(5) - (5)].qstr).data(),0);
                FlowChart::addFlowChart(FlowChart::BEGIN_NO,"BEGIN",0);
               ;}
    break;

  case 619:

    { 
                (yyvsp[(5) - (11)].qstr).stripPrefix((yyvsp[(4) - (11)].qstr).data());
                tempEntry=current;
                currP=0;
                createFunction(currName,VhdlDocGen::PROCESS,(yyvsp[(4) - (11)].qstr).data());
                createFlow();
                currName="";
               ;}
    break;

  case 620:

    { currP=0; ;}
    break;

  case 623:

    { (yyval.qstr)=""; ;}
    break;

  case 624:

    { (yyval.qstr)="postponed"; ;}
    break;

  case 625:

    { (yyval.qstr)=""; ;}
    break;

  case 626:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 627:

    { (yyval.qstr)=""; ;}
    break;

  case 628:

    { (yyval.qstr)=""; ;}
    break;

  case 629:

    { (yyval.qstr)+=(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 630:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 631:

    { (yyval.qstr)=""; ;}
    break;

  case 632:

    { (yyval.qstr)="all"; ;}
    break;

  case 633:

    { (yyval.qstr)=(yyvsp[(2) - (3)].qstr); ;}
    break;

  case 634:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+" "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 635:

    { (yyval.qstr)=""; ;}
    break;

  case 636:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+" "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 637:

    { (yyval.qstr)=","+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 638:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 639:

    { (yyval.qstr)=""; ;}
    break;

  case 640:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 641:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 642:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr);    FlowChart::addFlowChart(FlowChart::TEXT_NO,(yyval.qstr).data(),0); ;}
    break;

  case 643:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+(yyvsp[(2) - (2)].qstr); FlowChart::addFlowChart(FlowChart::TEXT_NO,(yyval.qstr).data(),0); ;}
    break;

  case 644:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 645:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 646:

    { (yyval.qstr)=""; ;}
    break;

  case 647:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 648:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 649:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); FlowChart::addFlowChart(FlowChart::TEXT_NO,(yyval.qstr).data(),0); ;}
    break;

  case 650:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); FlowChart::addFlowChart(FlowChart::TEXT_NO,(yyval.qstr).data(),0); ;}
    break;

  case 651:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); FlowChart::addFlowChart(FlowChart::RETURN_NO,(yyval.qstr).data(),0); ;}
    break;

  case 652:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 653:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); FlowChart::addFlowChart(FlowChart::TEXT_NO,(yyval.qstr).data(),0); ;}
    break;

  case 654:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); FlowChart::addFlowChart(FlowChart::TEXT_NO,(yyval.qstr).data(),0); ;}
    break;

  case 655:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); FlowChart::addFlowChart(FlowChart::TEXT_NO,(yyval.qstr).data(),0); ;}
    break;

  case 656:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+(yyvsp[(2) - (2)].qstr); FlowChart::addFlowChart(FlowChart::TEXT_NO,(yyval.qstr).data(),0); ;}
    break;

  case 657:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); FlowChart::addFlowChart(FlowChart::TEXT_NO,(yyval.qstr).data(),0); ;}
    break;

  case 658:

    { (yyval.qstr)=(yyvsp[(1) - (5)].qstr)+"report "+(yyvsp[(3) - (5)].qstr)+(yyvsp[(4) - (5)].qstr)+";";  ;}
    break;

  case 659:

    { (yyval.qstr)="assert "+(yyvsp[(2) - (5)].qstr)+(yyvsp[(3) - (5)].qstr)+(yyvsp[(4) - (5)].qstr)+";"; ;}
    break;

  case 660:

    { (yyval.qstr)=""; ;}
    break;

  case 661:

    { (yyval.qstr)=" serverity "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 662:

    { (yyval.qstr)=""; ;}
    break;

  case 663:

    { (yyval.qstr)=" report "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 664:

    { (yyval.qstr)=""; ;}
    break;

  case 665:

    { (yyval.qstr)="?"; ;}
    break;

  case 666:

    { (yyval.qstr)=""; ;}
    break;

  case 667:

    { (yyval.qstr)="?"; ;}
    break;

  case 668:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 669:

    {
                     QCString ca="case "+(yyvsp[(2) - (3)].qstr)+(yyvsp[(3) - (3)].qstr);
                     FlowChart::addFlowChart(FlowChart::CASE_NO,0,ca);
                   ;}
    break;

  case 670:

    { 
                     FlowChart::moveToPrevLevel();
                     FlowChart::addFlowChart(FlowChart::END_CASE,"end case",0);
                   ;}
    break;

  case 671:

    {
                     QCString ca="case "+(yyvsp[(3) - (4)].qstr)+(yyvsp[(4) - (4)].qstr);
                     FlowChart::addFlowChart(FlowChart::CASE_NO,0,ca);
                   ;}
    break;

  case 672:

    {
                     FlowChart::moveToPrevLevel();
             
                     FlowChart::addFlowChart(FlowChart::END_CASE,0,0);
                   ;}
    break;

  case 673:

    { (yyval.qstr)=""; ;}
    break;

  case 674:

    { (yyval.qstr)=""; ;}
    break;

  case 675:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 676:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 677:

    { 
    QCString t="when ";
    t+=(yyvsp[(2) - (3)].qstr)+"=> ";
    FlowChart::addFlowChart(FlowChart::WHEN_NO,(yyvsp[(2) - (3)].qstr).data(),t);
  ;}
    break;

  case 678:

    { (yyval.qstr)=""; FlowChart::moveToPrevLevel(); ;}
    break;

  case 679:

    {
    (yyvsp[(2) - (3)].qstr).prepend("if ");
    FlowChart::addFlowChart(FlowChart::IF_NO,0,(yyvsp[(2) - (3)].qstr));
  ;}
    break;

  case 680:

    {
    FlowChart::moveToPrevLevel();
    FlowChart::addFlowChart(FlowChart::ENDIF_NO,0,0);
  ;}
    break;

  case 681:

    { (yyval.qstr)=""; ;}
    break;

  case 682:

    {
    FlowChart::addFlowChart(FlowChart::ELSE_NO,0,0);
  ;}
    break;

  case 683:

    { (yyval.qstr)=""; ;}
    break;

  case 684:

    { (yyval.qstr)=""; ;}
    break;

  case 685:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 686:

    { 
    (yyvsp[(2) - (3)].qstr).prepend("elsif ");
    FlowChart::addFlowChart(FlowChart::ELSIF_NO,0,(yyvsp[(2) - (3)].qstr).data());
  ;}
    break;

  case 687:

    { (yyval.qstr)=""; ;}
    break;

  case 688:

    {
    (yyval.qstr)=(yyvsp[(1) - (8)].qstr)+(yyvsp[(2) - (8)].qstr)+" loop "+(yyvsp[(4) - (8)].qstr)+" end loop" +(yyvsp[(7) - (8)].qstr);
    QCString endLoop="end loop" + (yyvsp[(7) - (8)].qstr);
    FlowChart::moveToPrevLevel();
    FlowChart::addFlowChart(FlowChart::END_LOOP,endLoop.data(),0);
  ;}
    break;

  case 689:

    { (yyval.qstr)=""; ;}
    break;

  case 690:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 691:

    { (yyval.qstr)=""; 
                           FlowChart::addFlowChart(FlowChart::LOOP_NO,0,"infinite loop");
                         ;}
    break;

  case 693:

    { (yyval.qstr)=""; ;}
    break;

  case 694:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+":";lab=(yyvsp[(1) - (2)].qstr); ;}
    break;

  case 695:

    {
                         FlowChart::addFlowChart(FlowChart::EXIT_NO,"exit",(yyvsp[(4) - (5)].qstr).data(),(yyvsp[(3) - (5)].qstr).data()); 
                         lab.resize(0);
                       ;}
    break;

  case 696:

    { (yyval.qstr)=""; ;}
    break;

  case 697:

    { (yyval.qstr)="when "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 698:

    { (yyval.qstr)=""; ;}
    break;

  case 699:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr);lab=(yyval.qstr); ;}
    break;

  case 700:

    {
                         FlowChart::addFlowChart(FlowChart::NEXT_NO,"next ",(yyvsp[(4) - (5)].qstr).data(),(yyvsp[(3) - (5)].qstr).data()); 
                         lab.resize(0);
                       ;}
    break;

  case 701:

    { (yyval.qstr)=""; ;}
    break;

  case 702:

    { (yyval.qstr)="when "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 703:

    { (yyval.qstr)=""; ;}
    break;

  case 704:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr);lab=(yyval.qstr); ;}
    break;

  case 705:

    { (yyval.qstr)="null"; (yyval.qstr)+=";"; ;}
    break;

  case 706:

    {
   (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+";"; 
 ;}
    break;

  case 707:

    { (yyval.qstr)="return "+(yyvsp[(2) - (3)].qstr)+";"  ; ;}
    break;

  case 708:

    { (yyval.qstr)=""; ;}
    break;

  case 709:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 710:

    { (yyval.qstr)=(yyvsp[(1) - (4)].qstr)+" <="+(yyvsp[(3) - (4)].qstr)+";"  ; ;}
    break;

  case 711:

    { (yyval.qstr)=(yyvsp[(1) - (5)].qstr)+ "<= "+(yyvsp[(3) - (5)].qstr)+(yyvsp[(4) - (5)].qstr) +";"; ;}
    break;

  case 712:

    { (yyval.qstr)=(yyvsp[(1) - (6)].qstr)+ "<= "+ " force  "+(yyvsp[(4) - (6)].qstr)+";" ; ;}
    break;

  case 713:

    { (yyval.qstr)=(yyvsp[(1) - (5)].qstr)+ "<= "+" release "+(yyvsp[(4) - (5)].qstr) +";"; ;}
    break;

  case 714:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 715:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 716:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+";"; ;}
    break;

  case 717:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 718:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr); ;}
    break;

  case 719:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 720:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+":"; ;}
    break;

  case 721:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+":="+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 722:

    { (yyval.qstr)=(yyvsp[(1) - (4)].qstr)+(yyvsp[(2) - (4)].qstr)+":="+(yyvsp[(4) - (4)].qstr); ;}
    break;

  case 723:

    {
                     (yyval.qstr)="wait "+(yyvsp[(2) - (5)].qstr)+(yyvsp[(3) - (5)].qstr)+(yyvsp[(4) - (5)].qstr)+";";
                  ;}
    break;

  case 724:

    { (yyval.qstr)=""; ;}
    break;

  case 725:

    { (yyval.qstr)="for "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 726:

    { (yyval.qstr)=""; ;}
    break;

  case 727:

    { (yyval.qstr)=" until "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 728:

    { (yyval.qstr)=""; ;}
    break;

  case 729:

    { (yyval.qstr)=" on "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 730:

    { lastEntity=0; lastCompound=0; genLabels.resize(0); ;}
    break;

  case 732:

    { lastCompound=0; genLabels.resize(0); ;}
    break;

  case 733:

    { lastEntity=0;lastCompound=0; genLabels.resize(0); ;}
    break;

  case 734:

    { lastEntity=0; lastCompound=0; genLabels.resize(0); ;}
    break;

  case 735:

    { currP=VhdlDocGen::COMPONENT; ;}
    break;

  case 736:

    { currP=VhdlDocGen::COMPONENT; ;}
    break;

  case 737:

    {
             addVhdlType((yyvsp[(2) - (7)].qstr),getParsedLine(t_COMPONENT),Entry::VARIABLE_SEC,VhdlDocGen::COMPONENT,0,0);
             currP=0;
           ;}
    break;

  case 738:

    { (yyval.qstr)=""; ;}
    break;

  case 739:

    { (yyval.qstr)=(yyvsp[(2) - (3)].qstr); ;}
    break;

  case 740:

    { (yyval.qstr)=""; ;}
    break;

  case 741:

    { (yyval.qstr)=(yyvsp[(2) - (3)].qstr); ;}
    break;

  case 742:

    { levelCounter--; ;}
    break;

  case 743:

    {
          ;}
    break;

  case 744:

    { (yyval.qstr)=""; ;}
    break;

  case 745:

    { (yyval.qstr)=""; ;}
    break;

  case 746:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+"  "; ;}
    break;

  case 747:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 748:

    { (yyval.qstr)=""; ;}
    break;

  case 749:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr); ;}
    break;

  case 750:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 751:

    {
      (yyval.qstr)=(yyvsp[(1) - (1)].qstr);
      if (levelCounter==0)
        addConfigureNode((yyvsp[(1) - (1)].qstr).data(),NULL,TRUE,FALSE);
      else
        addConfigureNode((yyvsp[(1) - (1)].qstr).data(),NULL,FALSE,FALSE);
        levelCounter++;
    ;}
    break;

  case 752:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 753:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 754:

    {
               (yyval.qstr)=(yyvsp[(2) - (7)].qstr)+" "+(yyvsp[(3) - (7)].qstr)+" "+(yyvsp[(4) - (7)].qstr);
             ;}
    break;

  case 755:

    { (yyval.qstr)=""; ;}
    break;

  case 756:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 757:

    { (yyval.qstr)=""; ;}
    break;

  case 758:

    { 
  (yyval.qstr)=""; 
;}
    break;

  case 759:

    { (yyval.qstr)=""; ;}
    break;

  case 760:

    {
               addConfigureNode(compSpec.data(),(yyvsp[(2) - (3)].qstr).data(),FALSE,TRUE);
             ;}
    break;

  case 761:

    { 
               addConfigureNode((yyvsp[(2) - (4)].qstr).data(),(yyvsp[(3) - (4)].qstr).data(),TRUE,FALSE,TRUE);
             ;}
    break;

  case 762:

    { 
               addConfigureNode((yyvsp[(2) - (7)].qstr).data(),(yyvsp[(3) - (7)].qstr).data(),TRUE,FALSE,TRUE);
              ;}
    break;

  case 763:

    { 
                                                     (yyval.qstr)=(yyvsp[(2) - (2)].qstr);
                                                   ;}
    break;

  case 764:

    { 
  (yyval.qstr)="";
;}
    break;

  case 765:

    { 
                          (yyval.qstr)="";
                           ;}
    break;

  case 766:

    {
               (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+":"+(yyvsp[(3) - (3)].qstr);
               compSpec=(yyval.qstr);
             ;}
    break;

  case 767:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 768:

    { (yyval.qstr)="all"; ;}
    break;

  case 769:

    { (yyval.qstr)="others"; ;}
    break;

  case 770:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr); ;}
    break;

  case 771:

    { (yyval.qstr)=""; ;}
    break;

  case 772:

    { (yyval.qstr)="port map "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 773:

    { (yyval.qstr)=""; ;}
    break;

  case 774:

    { (yyval.qstr)="generic map "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 775:

    { (yyval.qstr)="entity "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 776:

    { (yyval.qstr)="configuration "+ (yyvsp[(2) - (2)].qstr); ;}
    break;

  case 777:

    { (yyval.qstr)="open "; ;}
    break;

  case 778:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 779:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 780:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 781:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+","+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 782:

    {
                      // $$=$2+":"+$4+$6;
                      (yyval.qstr)="("+(yyvsp[(4) - (8)].qstr)+(yyvsp[(6) - (8)].qstr)+")";
                      addVhdlType((yyvsp[(2) - (8)].qstr),getParsedLine(t_GROUP),Entry::VARIABLE_SEC,VhdlDocGen::GROUP,(yyval.qstr).data(),0);
                    ;}
    break;

  case 783:

    {
                      (yyval.qstr)=(yyvsp[(2) - (7)].qstr)+":"+(yyvsp[(5) - (7)].qstr);
                      addVhdlType((yyvsp[(2) - (7)].qstr),getParsedLine(t_GROUP),Entry::VARIABLE_SEC,VhdlDocGen::GROUP,(yyvsp[(5) - (7)].qstr).data(),0);
                    ;}
    break;

  case 784:

    { (yyval.qstr)=""; ;}
    break;

  case 785:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 786:

    { (yyval.qstr)="";   ;}
    break;

  case 787:

    { (yyval.qstr)="<>"; ;}
    break;

  case 788:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 789:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+","+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 790:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 791:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 792:

    {
      (yyval.qstr)=s_str.qstr;
    ;}
    break;

  case 793:

    {
      (yyval.qstr)=s_str.qstr;
    ;}
    break;

  case 794:

    {
      (yyval.qstr)=s_str.qstr;
    ;}
    break;

  case 795:

    {
      (yyval.qstr)=s_str.qstr;
    ;}
    break;

  case 796:

    {
      (yyval.qstr)=s_str.qstr;
    ;}
    break;

  case 797:

    { (yyval.qstr)=""; ;}
    break;

  case 798:

    { (yyval.qstr)=""; ;}
    break;

  case 808:

    { (yyval.qstr)=""; ;}
    break;

  case 809:

    { (yyval.qstr)=""; ;}
    break;

  case 816:

    { (yyval.qstr)="context "+(yyvsp[(2) - (3)].qstr); ;}
    break;

  case 817:

    { parse_sec=CONTEXT_SEC; ;}
    break;

  case 818:

    {
                          parse_sec=0;
                          QCString v=(yyvsp[(5) - (8)].qstr);
                          addVhdlType((yyvsp[(2) - (8)].qstr),getParsedLine(t_LIBRARY),Entry::VARIABLE_SEC,VhdlDocGen::LIBRARY,"context",(yyvsp[(5) - (8)].qstr).data());
                        ;}
    break;

  case 819:

    {
                          addVhdlType((yyvsp[(2) - (6)].qstr),getParsedLine(t_LIBRARY),Entry::VARIABLE_SEC,VhdlDocGen::LIBRARY,"context",0);
                        ;}
    break;

  case 822:

    { (yyval.qstr) = (yyvsp[(1) - (1)].qstr); ;}
    break;

  case 823:

    { (yyval.qstr) = (yyvsp[(1) - (2)].qstr)+"#"+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 824:

    { (yyval.qstr) = (yyvsp[(1) - (1)].qstr); ;}
    break;

  case 825:

    { (yyval.qstr) = (yyvsp[(1) - (1)].qstr); ;}
    break;

  case 826:

    { (yyval.qstr) = (yyvsp[(1) - (1)].qstr); ;}
    break;

  case 827:

    {
      (yyval.qstr)=" is new "+(yyvsp[(5) - (7)].qstr)+(yyvsp[(6) - (7)].qstr);
      //Entry * pp=lastCompound;
      //Entry * pps=lastEntity  ;
      //assert(false);
      addVhdlType((yyvsp[(2) - (7)].qstr),getParsedLine(t_PACKAGE),Entry::VARIABLE_SEC,VhdlDocGen::INSTANTIATION,"package",(yyval.qstr).data());
    ;}
    break;

  case 828:

    {
      (yyval.qstr)=" is new "+(yyvsp[(5) - (8)].qstr)+(yyvsp[(6) - (8)].qstr);
      addVhdlType((yyvsp[(2) - (8)].qstr),getParsedLine(t_PACKAGE),Entry::VARIABLE_SEC,VhdlDocGen::INSTANTIATION,"package",(yyval.qstr).data());
    ;}
    break;

  case 829:

    { (yyval.qstr)=""; ;}
    break;

  case 830:

    {
      (yyval.qstr)= " is new "+(yyvsp[(5) - (7)].qstr)+(yyvsp[(6) - (7)].qstr);
      addVhdlType((yyvsp[(2) - (7)].qstr),getParsedLine(t_FUNCTION),Entry::VARIABLE_SEC,VhdlDocGen::INSTANTIATION,"function ",(yyval.qstr).data());
    ;}
    break;

  case 831:

    {
      (yyval.qstr)=" is new "+(yyvsp[(5) - (8)].qstr)+(yyvsp[(6) - (8)].qstr);
      addVhdlType((yyvsp[(2) - (8)].qstr),getParsedLine(t_FUNCTION),Entry::VARIABLE_SEC,VhdlDocGen::INSTANTIATION,"function ",(yyval.qstr).data());
    ;}
    break;

  case 832:

    { (yyval.qstr)=""; ;}
    break;

  case 833:

    { (yyval.qstr)=""; ;}
    break;

  case 834:

    { (yyval.qstr)="["+(yyvsp[(2) - (3)].qstr)+" ]"; ;}
    break;

  case 835:

    { (yyval.qstr)="[ ]"; ;}
    break;

  case 836:

    { (yyval.qstr)="return "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 837:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 838:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+" return "+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 839:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 840:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+" "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 841:

    { (yyval.qstr)=" , "+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 851:

    { (yyval.qstr)=""; ;}
    break;

  case 852:

    { (yyval.qstr)=""; ;}
    break;

  case 862:

    { (yyval.qstr)=""; ;}
    break;

  case 863:

    { (yyval.qstr)=""; ;}
    break;

  case 871:

    { (yyval.qstr)=""; ;}
    break;

  case 872:

    { (yyval.qstr)=" in "; ;}
    break;

  case 873:

    { (yyval.qstr)="out"; ;}
    break;

  case 874:

    { (yyval.qstr)=" transport "; ;}
    break;

  case 875:

    { (yyval.qstr)=" reject "+(yyvsp[(2) - (3)].qstr)+"inertial "; ;}
    break;

  case 876:

    { (yyval.qstr)=" inertial "; ;}
    break;

  case 882:

    { (yyval.qstr)=""; ;}
    break;

  case 888:

    { (yyval.qstr) = (yyvsp[(1) - (1)].qstr); ;}
    break;

  case 889:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 890:

    { (yyval.qstr) = "procedure "+(yyvsp[(2) - (3)].qstr)+(yyvsp[(3) - (3)].qstr); current->name=(yyvsp[(2) - (3)].qstr); ;}
    break;

  case 891:

    {
      QCString s=(yyvsp[(6) - (6)].qstr);
      if (!s.isEmpty())
      {
        s.prepend(" is ");
      }
      (yyval.qstr)=" function "+(yyvsp[(2) - (6)].qstr)+(yyvsp[(3) - (6)].qstr)+(yyvsp[(5) - (6)].qstr)+s;
      current->name=(yyvsp[(2) - (6)].qstr);
    ;}
    break;

  case 892:

    {
      QCString s=(yyvsp[(7) - (7)].qstr);
      if (!s.isEmpty())
      {
        s.prepend(" is ");
      }
      (yyval.qstr)=(yyvsp[(1) - (7)].qstr)+" function "+(yyvsp[(3) - (7)].qstr)+(yyvsp[(4) - (7)].qstr)+" return "+(yyvsp[(6) - (7)].qstr)+s;
      current->name=(yyvsp[(3) - (7)].qstr);
    ;}
    break;

  case 893:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 894:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 895:

    { (yyval.qstr)="";   ;}
    break;

  case 896:

    { (yyval.qstr)=(yyvsp[(2) - (2)].qstr);   ;}
    break;

  case 897:

    { (yyval.qstr)="<>"; ;}
    break;

  case 898:

    { (yyval.qstr)=""; ;}
    break;

  case 899:

    { (yyval.qstr)="parameter "; ;}
    break;

  case 900:

    { parse_sec=PARAM_SEC; ;}
    break;

  case 901:

    { parse_sec=0; ;}
    break;

  case 902:

    { (yyval.qstr)="("+(yyvsp[(2) - (4)].qstr)+")"; ;}
    break;

  case 903:

    {
                          (yyval.qstr)="package "+(yyvsp[(2) - (5)].qstr)+" is new "+(yyvsp[(5) - (5)].qstr);
                          current->name=(yyvsp[(2) - (5)].qstr);
                        ;}
    break;

  case 904:

    { 
                          (yyval.qstr)="package "+(yyvsp[(2) - (6)].qstr)+" is new "+(yyvsp[(5) - (6)].qstr)+"( ... )" ; 
                          current->name=(yyvsp[(2) - (6)].qstr); 
                        ;}
    break;

  case 906:

    {
                          //int u=s_str.iLine;
                          parse_sec=GEN_SEC;
                        ;}
    break;

  case 907:

    {
                          QCString vo=(yyvsp[(3) - (3)].qstr);
                          parse_sec=0;
                        ;}
    break;

  case 908:

    {
                          QCString s="<<"+(yyvsp[(2) - (6)].qstr);
                          QCString s1=(yyvsp[(3) - (6)].qstr)+":"+(yyvsp[(5) - (6)].qstr)+">>";
                          (yyval.qstr)=s+s1;
                        ;}
    break;

  case 909:

    { (yyval.qstr)="constant "; ;}
    break;

  case 910:

    { (yyval.qstr)="signal ";   ;}
    break;

  case 911:

    { (yyval.qstr)="variable "; ;}
    break;

  case 912:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 913:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 914:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 915:

    { (yyval.qstr)="."+(yyvsp[(2) - (3)].qstr)+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 916:

    { (yyval.qstr)="."+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 917:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+(yyvsp[(2) - (3)].qstr)+(yyvsp[(3) - (3)].qstr); ;}
    break;

  case 918:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 919:

    { (yyval.qstr)="^."; ;}
    break;

  case 920:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+"^."; ;}
    break;

  case 921:

    { (yyval.qstr)=(yyvsp[(1) - (1)].qstr); ;}
    break;

  case 922:

    { (yyval.qstr)=(yyvsp[(1) - (4)].qstr)+"("+(yyvsp[(3) - (4)].qstr)+")"; ;}
    break;

  case 923:

    { (yyval.qstr)=(yyvsp[(1) - (2)].qstr)+"."; ;}
    break;

  case 924:

    { (yyval.qstr)=(yyvsp[(1) - (3)].qstr)+(yyvsp[(2) - (3)].qstr)+"."; ;}
    break;

  case 925:

    { (yyval.qstr)="@"+(yyvsp[(2) - (2)].qstr); ;}
    break;

  case 926:

    {
// fprintf(stderr,"\n  tooldir %s",s_str.qstr.data() );
;}
    break;


/* Line 1267 of yacc.c.  */

      default: break;
    }
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;


  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
      {
	YYSIZE_T yysize = yysyntax_error (0, yystate, yychar);
	if (yymsg_alloc < yysize && yymsg_alloc < YYSTACK_ALLOC_MAXIMUM)
	  {
	    YYSIZE_T yyalloc = 2 * yysize;
	    if (! (yysize <= yyalloc && yyalloc <= YYSTACK_ALLOC_MAXIMUM))
	      yyalloc = YYSTACK_ALLOC_MAXIMUM;
	    if (yymsg != yymsgbuf)
	      YYSTACK_FREE (yymsg);
	    yymsg = (char *) YYSTACK_ALLOC (yyalloc);
	    if (yymsg)
	      yymsg_alloc = yyalloc;
	    else
	      {
		yymsg = yymsgbuf;
		yymsg_alloc = sizeof yymsgbuf;
	      }
	  }

	if (0 < yysize && yysize <= yymsg_alloc)
	  {
	    (void) yysyntax_error (yymsg, yystate, yychar);
	    yyerror (yymsg);
	  }
	else
	  {
	    yyerror (YY_("syntax error"));
	    if (yysize != 0)
	      goto yyexhaustedlab;
	  }
      }
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse look-ahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse look-ahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (yyn != YYPACT_NINF)
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;


      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  *++yyvsp = yylval;


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#ifndef yyoverflow
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEOF && yychar != YYEMPTY)
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval);
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}




extern FILE* yyout;
extern YYSTYPE vhdlScanYYlval;

void vhdlScanYYerror(const char* /*str*/)
{
  // fprintf(stderr,"\n<---error at line %d  : [ %s]   in file : %s ---->",s_str.yyLineNr,s_str.qstr.data(),s_str.fileName);
  //  exit(0);
}

void vhdlParse()
{
  vhdlScanYYparse();
}

struct VhdlContainer*  getVhdlCont()
{
  return &s_str;
}

Entry* getVhdlCompound()
{
  if (lastEntity) return lastEntity;
  if (lastCompound) return lastCompound;
  return NULL;
}

QList<VhdlConfNode>& getVhdlConfiguration() { return  configL; }

static void addCompInst(char *n, char* instName, char* comp,int iLine)
{

  current->spec=VhdlDocGen::INSTANTIATION;
  current->section=Entry::VARIABLE_SEC;
  current->startLine=iLine;
  current->bodyLine=iLine;
  current->type=instName;                       // foo:instname e.g proto or work. proto(ttt)
  current->exception=genLabels.lower();         // |arch|label1:label2...
  current->name=n;                              // foo
  current->args=lastCompound->name;             // architecture name
  current->includeName=comp;                    // component/enity/configuration
  int u=genLabels.find("|",1);
  if (u>0)
  {
    current->write=genLabels.right(genLabels.length()-u);
    current->read=genLabels.left(u);
  }
  //printf  (" \n genlable: [%s]  inst: [%s]  name: [%s] %d\n",n,instName,comp,iLine);

  if (lastCompound)
  {
    current->args=lastCompound->name;
    if (true) // !findInstant(current->type))
    {
      initEntry(current);
      instFiles.append(new Entry(*current));
    }

    Entry *temp=current;  // hold  current pointer  (temp=oldEntry)
    current=new Entry;     // (oldEntry != current)
    delete  temp;
  }
  else
  {
    newEntry();
  }
}

static void pushLabel( QCString &label,QCString & val)
{
  label+="|";
  label+=val;
}

static QCString  popLabel(QCString & q)
{
  QCString u=q;
  int i=q.findRev("|");
  if (i<0) return "";
  q = q.left(i);
  return q;
}

static void addConfigureNode(const char* a,const char*b, bool,bool isLeaf,bool inlineConf)
{
  VhdlConfNode* co=0;
  QCString ent,arch,lab;
  QCString l=genLabels;
  ent=a;
  lab =  VhdlDocGen::parseForConfig(ent,arch);

  if (b)
  {
    ent=b;
    lab=VhdlDocGen::parseForBinding(ent,arch);
  }
  int level=0;

  if(!configL.isEmpty())
  {
    VhdlConfNode* vc=configL.last();
    level=vc->level;
    if (levelCounter==0)
      pushLabel(forL,ent);
    else if (level<levelCounter)
    {
      if (!isLeaf)
      {
        pushLabel(forL,ent);
      }
    }
    else if (level>levelCounter)
    {
      forL=popLabel(forL); 
    }
  }
  else
  {
    pushLabel(forL,ent);
  }


  if (inlineConf)
  {
    confName=lastCompound->name;
  }

  //fprintf(stderr,"\n[%s %d %d]\n",forL.data(),levelCounter,level);
  co=new VhdlConfNode(a,b,confName.lower().data(),forL.lower().data(),isLeaf);

  if (inlineConf)
  {
    co->isInlineConf=TRUE;
  }

  configL.append(co);

}// addConfigure

//  ------------------------------------------------------------------------------------------------------------

static bool isFuncProcProced()
{
  if (currP==VhdlDocGen::FUNCTION ||
      currP==VhdlDocGen::PROCEDURE ||
      currP==VhdlDocGen::PROCESS
     )
  {
    return TRUE;
  }
  return FALSE;
}

static void initEntry(Entry *e)
{
  e->fileName = s_str.fileName;
  e->lang=SrcLangExt_VHDL;
  isVhdlDocPending();
  initGroupInfo(e);
}

static void addProto(const char *s1,const char *s2,const char *s3,
    const char *s4,const char *s5,const char *s6)
{
  (void)s5; // avoid unused warning
  static QRegExp reg("[\\s]");
  QCString name=s2;
  QStringList ql=QStringList::split(",",name,FALSE);

  for (uint u=0;u<ql.count();u++)
  {
    Argument *arg=new Argument;
    arg->name=ql[u].utf8();
    if (s3)
    {
      arg->type=s3;
    }
    arg->type+=" ";
    arg->type+=s4;
    if (s6)
    {
      arg->type+=s6;
    }
    if (parse_sec==GEN_SEC && param_sec==0)
    {
      arg->defval="gen!";
    }

    if (parse_sec==PARAM_SEC)
    {
      assert(false);
    }

    arg->defval+=s1;
    arg->attrib="";//s6;

    current->argList->append(arg);
    current->args+=s2;
    current->args+=",";
  }
}

static void createFunction(const QCString &impure,uint64 spec,
    const QCString &fname)
{

  current->spec=spec;
  current->section=Entry::FUNCTION_SEC;

  if (impure=="impure" || impure=="pure")  
  {
    current->exception=impure;
  }

  if (parse_sec==GEN_SEC)
  {
    current->spec= VhdlDocGen::GENERIC;
    current->section=Entry::FUNCTION_SEC;
  }

  if (currP==VhdlDocGen::PROCEDURE)
  {
    current->name=impure;
    current->exception="";
  }
  else
  {
    current->name=fname;
  }

  if (spec==VhdlDocGen::PROCESS)
  {

    current->args=fname;
    current->name=impure;
    VhdlDocGen::deleteAllChars(current->args,' ');
    if (!fname.isEmpty())
    {
      QStringList q1=QStringList::split(",",fname);
      for (uint ii=0;ii<q1.count();ii++)
      {
        Argument *arg=new Argument;
        arg->name=q1[ii].utf8();
        current->argList->append(arg);
      }
    }
    return;
  }

  current->startLine=s_str.iLine;
  current->bodyLine=s_str.iLine;

}

static void addVhdlType(const QCString &name,int startLine,int section,
    uint64 spec,const char* args,const char* type,Protection prot)
{
  static QRegExp reg("[\\s]");

  if (isFuncProcProced() || VhdlDocGen::getFlowMember())   return;
    
  if (parse_sec==GEN_SEC)
  {
    spec= VhdlDocGen::GENERIC;
  }

  // more than one name   ?
  QStringList ql=QStringList::split(",",name,FALSE);

  for (uint u=0;u<ql.count();u++)
  {
    current->name=ql[u].utf8();
  

    current->startLine=startLine;
    current->bodyLine=startLine;
    current->section=section;
    current->spec=spec;
    current->fileName=s_str.fileName;
    if (current->args.isEmpty())
    {
      current->args=args;
      current->args.replace(reg,"%"); // insert dummy chars because wihte spaces are removed
    }
    current->type=type;
    current->type.replace(reg,"%"); // insert dummy chars because white spaces are removed
    current->protection=prot;
 
       if (!lastCompound && (section==Entry::VARIABLE_SEC) &&  (spec == VhdlDocGen::USE || spec == VhdlDocGen::LIBRARY) )
       {
         libUse.append(new Entry(*current));
         current->reset();
       }
    newEntry();
  }
}

static void newEntry()
{

  if (VhdlDocGen::isVhdlClass(current))
  {
    current_root->addSubEntry(current);
  }
  else
  {
    if (lastCompound)
    {
      lastCompound->addSubEntry(current);
    }
    else
    {
      if (lastEntity)
      {
        lastEntity->addSubEntry(current);
      }
      else
      {
        current_root->addSubEntry(current);
      }
    }
  }
  current = new Entry ;
  initEntry(current);
}

void createFlow()
{
  if (!VhdlDocGen::getFlowMember()) 
  {
    return;
  }
  QCString q,ret;

  if (currP==VhdlDocGen::FUNCTION)
  {
    q=":function( ";
    FlowChart::alignFuncProc(q,tempEntry->argList,true);
    q+=")";
  }
  else if (currP==VhdlDocGen::PROCEDURE)
  {
    q=":procedure (";    
    FlowChart::alignFuncProc(q,tempEntry->argList,false);
    q+=")";
  }
  else  
  {  
    q=":process( "+tempEntry->args;
    q+=")";
  }

  q.prepend(VhdlDocGen::getFlowMember()->name().data());

  FlowChart::addFlowChart(FlowChart::START_NO,q,0);

  if (currP==VhdlDocGen::FUNCTION)
  {
    ret="end function ";  
  }
  else if (currP==VhdlDocGen::PROCEDURE)
  {
    ret="end procedure";
  }
  else 
  {
    ret="end process ";
  }

  FlowChart::addFlowChart(FlowChart::END_NO,ret,0);
  //  FlowChart::printFlowList();
  FlowChart::writeFlowChart();  
  currP=0;
}


