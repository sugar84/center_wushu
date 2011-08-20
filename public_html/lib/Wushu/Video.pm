package Wushu::Video;
use Mojo::Base 'Mojolicious::Controller';


sub list {
	my $self = shift;

	$self->render;
}

1;
