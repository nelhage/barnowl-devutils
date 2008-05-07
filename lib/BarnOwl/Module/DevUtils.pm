use warnings;
use strict;

=head1 NAME

BarnOwl::Module::DevUtils

=head1 DESCRIPTION

Provides some small utilities to aid perl development in BarnOwl

=cut

package BarnOwl::Module::DevUtils;
use Data::Dumper;

BarnOwl::new_command(
    eperl => sub { goto \&cmd_eperl },
    {
        summary     => 'Open the edit window for perl code',
        description => 'Opens the edit window and allows the user to '
          . 'enter perl code, and executes the entered code'
    }
);

sub cmd_eperl {
    BarnOwl::start_edit_win("Enter perl to eval: ", \&eval_perl);
}

sub eval_perl {
    my $perl = shift;
    BarnOwl::message(eval "package main; $perl");
}

1;
