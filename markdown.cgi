#!/usr/bin/perl

use strict;
use warnings;
use CGI::Carp qw(fatalsToBrowser);

my $f;
open(FH, $ENV{PATH_TRANSLATED}) || die "Unable to open: $ENV{PATH_TRANSLATED}!";
while(<FH>) { $f .= $_; }

my $template = << 'STRAPDOWN_HTML';
Content-type: text/html

<!DOCTYPE html>
<html>
<head>
<title>Analytics (powerd by d3.js)</title>
<link rel="stylesheet" href="lib/strapdown/v/0.2/themes/bootstrap.min.css" media="screen">
<link rel="stylesheet" href="lib/strapdown/v/0.2/themes/bootstrap-responsive.min.css" media="screen">
<link rel="icon" href="/favicon.ico">
</head>

<xmp theme="united" style="display:none;">__CONTENT__</xmp>
<div class="navbar navbar-default navbar-fixed-top">
        <div class="container">
                <div class="navbar-header">
                        <a href="../" class="navbar-brand">Analytics (powered by D3.js)</a>
                </div>
                <div class="navbar-collapse collapse" id="navbar-main">
                        <ul class="nav navbar-nav navbar-right">
                                <li><a href="../about.md">About</a></li>
                                <li><a href="../daas.md">DaaS</a></li>
                                <li><a href="../gallery.md">Gallery</a></li>
                        </ul>
                </div>
        </div>
</div>

<script src="lib/strapdown/v/0.2/strapdown.js"></script>
<script src="lib/upload.js"></script>

</html>
STRAPDOWN_HTML

$template =~ s/__CONTENT__/$f/g;
print $template;

