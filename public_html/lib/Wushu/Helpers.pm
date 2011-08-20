package Wushu::Helpers;

use Mojo::Base 'Mojolicious::Plugin';
use utf8;

sub register {
	my $self = shift;
	
	$self->utils(@_);
}

sub utils {
	my $self = shift;
	
	$app->renderer->add_helper(current_url => sub {
		return $_[0]->tx->req->url->path->parts->[ $_[1] ] || ''; 
	});
}

1;
