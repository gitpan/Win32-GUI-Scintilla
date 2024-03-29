# perl -w
use Win32::GUI;
use Win32::GUI::Scintilla;

# main Window
$Window = new Win32::GUI::Window (
    -name     => "Window",
    -title    => "Scintilla test",
    -pos      => [100, 100],
    -size     => [400, 400],
) or die "new Window";

$Edit = $Window->AddButton  (
    -name     => "Test",
    -text     => "Test",
    -pos      => [0, 0],
    -size     => [100, 10],
);

# Create Scintilla Edit Window
# $Edit = new Win32::GUI::Scintilla  (
#               -parent  => $Window,
# Or
$Edit = $Window->AddScintilla  (
               -name    => "Edit",
               -pos     => [0, 10],
               -size    => [400, 400],
               -text    => "Test\n",
) or die "new Edit";

# Call Some method
$Edit->AddText ("add\n");
$Edit->AppendText ("append\n");

# Event loop
$Window->Show();
Win32::GUI::Dialog();

# Main window event handler
sub Window_Terminate {
 # Call Some method
 print "GetText = ", $Edit->GetText(), "\n";
 print "GetLine(1) = ", $Edit->GetLine(1), "\n";
 print "GetSelText = ", $Edit->GetSelText(), "\n";
 print "GetTextRange(2) = ", $Edit->GetTextRange(2), "\n";
 print "GetTextRange(2, 6) = ", $Edit->GetTextRange(2, 6), "\n";
 return -1;
}
# Main window resize
sub Window_Resize {

  if (defined $Window) {
    ($width, $height) = ($Window->GetClientRect)[2..3];
    $Edit->Move   (0, 10);
    $Edit->Resize ($width, $height-10);
  }
}

# Scintilla Event Notification
sub Edit_Notify {

  my (%evt) = @_;
 # print "Edit Notify = ", %evt, "\n";
}


sub Edit_Change {
  print "Change!!!\n";
}

sub Edit_GotFocus {
  print "GotFocus!!!\n";
}

sub Edit_LostFocus {
  print "LostFocus!!!\n";
}
