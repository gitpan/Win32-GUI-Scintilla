use ExtUtils::MakeMaker;

# autogen Scintilla.pm
do '.\include\autogen.pl';

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'              => 'Win32::GUI::Scintilla',
    'VERSION_FROM'      => 'Scintilla.pm', # finds $VERSION
    'PREREQ_PM'         => {}, # e.g., Module::Name => 1.1
    'PM' => {
        'Scintilla.pm'  => '$(INST_LIBDIR)/Scintilla.pm',
        'Perl.pm'       => '$(INST_LIBDIR)/Scintilla/Perl.pm',
    },
    ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
      (ABSTRACT => 'Add Scintilla control to Win32::GUI',
       AUTHOR   => 'ROCHER Laurent (rocherl@club-internet.fr)') : ()),
    'LIBS'              => [''], # e.g., '-lm'
    'DEFINE'            => '', # e.g., '-DHAVE_SOMETHING'
        # Insert -I. if you add *.h files later:
    'INC'               => '', # e.g., '-I/usr/include/other'
        # Un-comment this if you add C files to link with later:
    # 'OBJECT'          => '$(O_FILES)', # link all the C files too
);

# Copy SciLexer.DLL
mkdir './blib';
mkdir './blib/arch';
mkdir './blib/arch/auto';
mkdir './blib/arch/auto/Win32/';
mkdir './blib/arch/auto/Win32/GUI';
mkdir './blib/arch/auto/Win32/GUI/Scintilla';
system ('copy .\include\SciLexer.dll .\blib\arch\auto\Win32\GUI\Scintilla\SciLexer.dll');
