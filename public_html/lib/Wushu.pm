package Wushu;
use Mojo::URL;
use Mojo::Base 'Mojolicious';

use List::Util qw/first/;

has conf => sub {do "conf/app.conf"};

# This method will run once at server start
sub startup {
	my $self = shift;

	
	if (first {/^FCGI/} keys %ENV) {
		$self->hook( before_dispatch => sub {
			my $self = shift;
			$self->req->url->base( Mojo::URL->new(q{http://sugar.fluxflex.com/}) );
			# XXX try to automate
		});
	}
	else {
		$self->app->log->handle(\*STDERR); # XXX move it to conf-file
	}

	# Routes
	# о центре, направления и стили, инструктора, видео, фото, новости, статьи, ссылки, контакты
	my $r = $self->routes;

	$r->route( '/'         )->to( 'main#info'     );
	$r->route( '/styles'   )->to( 'styles#info'   );
	$r->route( '/coach'    )->to( 'coach#list'    );
	$r->route( '/video'    )->to( 'video#list'    );
	$r->route( '/news'     )->to( 'news#list'     );
	$r->route( '/articles' )->to( 'aritcles#list' );
	$r->route( '/refs'     )->to( 'refs#info'     );
	$r->route( '/contacts' )->to( 'contacts#info' );

	$r->route('/welcome')->to('example#welcome');
}

1;
