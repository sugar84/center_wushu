package Wushu;
use Mojo::URL;
use Mojo::Base 'Mojolicious';

has conf => sub {do "conf/app.conf"};

# This method will run once at server start
sub startup {
	my $self = shift;

	# Documentation browser under "/perldoc" (this plugin requires Perl 5.10)
	# $self->plugin('pod_renderer');
	$self->hook( before_dispatch => sub {
		my $self = shift;
		# notice: url must be fully-qualified or absolute, ending in '/' matters.
		$self->req->url->base( Mojo::URL->new(q{http://sugar.fluxflex.com/}) );
	});

	# Routes
	my $r = $self->routes;

	# Normal route to controller
	$r->route('/welcome')->to('example#welcome');
	$r->route('/'       )->to('example#list');
}

1;
