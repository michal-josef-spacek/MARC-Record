package MARC::Charset::Controls;

=head1 NAME

MARC::Charset::Controls - A MARC8/UTF8 mapping for MARC8 Control Characters

=head1 SYNOPSIS

 use MARC::Charset::Controls;
 my $cs = MARC::Charset::Controls->new();

=head1 DESCRIPTION

MARC::Charset::Controls provides a mapping between the MARC8 control character
set and Unicode(UTF8). It is typically used by MARC::Charset, so you 
probably don't need to use this yourself. 

=head1 METHODS

=cut 

use strict;
use constant CHAR_SIZE	    => 1;
our %marc2unicode;

=head1 

The constructor, which will return you a MARC::Charset::Controls object.

=cut


sub new {
    my $class = shift;
    return bless {}, ref($class) || $class;
}

=head1 name()

Returns the name of the character set.

=cut


sub name {
    return('Controls');
}

=head1 lookup()

The workhorse method that does the lookup. Pass it an a character and you'll
get back the UTF8 character.

=cut


sub lookup {
    my ($self,$char) = @_; 
    return($marc2unicode{$char});
}

=head1 combining()

Pass it a character and you'll get back a true value (1) if the character is 
a combining character, and false (undef) if it is not.

=cut


sub combining {
    return(undef); ## no combining chars
}

=head1 getCharSize()

Returns the number of bytes in each character of this character set.

=cut


sub getCharSize {
    return(CHAR_SIZE);
}

%marc2unicode = (

chr(0x1B)=>chr(0x001B), # ESCAPE (Unlikely to occur in UCS/Unicode)
chr(0x1D)=>chr(0x001D), # RECORD TERMINATOR / GROUP SEPARATOR
chr(0x1E)=>chr(0x001E), # FIELD TERMINATOR / RECORD SEPARATOR
chr(0x1F)=>chr(0x001F), # SUBFIELD DELIMITER / UNIT SEPARATOR
chr(0x20)=>chr(0x0020), # SPACE
chr(0x88)=>chr(0x0098), # NON-SORT BEGIN / START OF STRING
chr(0x89)=>chr(0x009C), # NON-SORT END / STRING TERMINATOR
chr(0x8D)=>chr(0x200D), # JOINER / ZERO WIDTH JOINER
chr(0x8E)=>chr(0x200C), # NON-JOINER / ZERO WIDTH NON-JOINER

);

=head1 TODO

=over 4 

=item *

=back

=head1 AUTHORS

=over 4

=item Ed Summers <ehs@pobox.com>

=back

=cut



1;
