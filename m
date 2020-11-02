Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id F11F32A3649
	for <lists+linux-audit@lfdr.de>; Mon,  2 Nov 2020 23:09:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604354943;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=01336eCf5ydlkz4L2qEhEB0LAkbrlRZxOC34fMXmKo8=;
	b=Ilv3cJTnMlsNR19j8u4VzId17A0k/e4nZ9iVVuwMibFhi9w/y4ITkfvjIfHS3bTasuV+7Y
	idISn7NsTznnfVP9Tenfzw12UDICbpTcTXOs6ATwgHz4+hIkyuYABJbIMnnVcZZGTl6bx4
	SYy8Pg27kqSdzzTgouq3/GgI7+8mXew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-9ZbZpT1iPwuD5hGTjhJZBg-1; Mon, 02 Nov 2020 17:09:01 -0500
X-MC-Unique: 9ZbZpT1iPwuD5hGTjhJZBg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C540C18A6281;
	Mon,  2 Nov 2020 22:08:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E4DE5C3E0;
	Mon,  2 Nov 2020 22:08:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2D1D7181A71F;
	Mon,  2 Nov 2020 22:08:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A2M8ikP017918 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 2 Nov 2020 17:08:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 34EA95DA33; Mon,  2 Nov 2020 22:08:44 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.8])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 034E95D9DD;
	Mon,  2 Nov 2020 22:08:36 +0000 (UTC)
Date: Mon, 2 Nov 2020 17:08:34 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [RFC PATCH] audit-testsuite: tests for subject and object
	correctness
Message-ID: <20201102220834.GD55072@madcap2.tricolour.ca>
References: <e4bf30e2-a92f-99b7-30d0-3e3473e30399.ref@schaufler-ca.com>
	<e4bf30e2-a92f-99b7-30d0-3e3473e30399@schaufler-ca.com>
MIME-Version: 1.0
In-Reply-To: <e4bf30e2-a92f-99b7-30d0-3e3473e30399@schaufler-ca.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
Cc: "linux-audit@redhat.com" <linux-audit@redhat.com>
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020-11-02 13:54, Casey Schaufler wrote:
> Verify that there are subj= and obj= fields in a record
> if and only if they are expected. A system without a security
> module that provides these fields should not include them.
> A system with multiple security modules providing these fields
> (e.g. SELinux and AppArmor) should always provide "?" for the
> data and also include a AUDIT_MAC_TASK_CONTEXTS or
> AUDIT_MAC_OBJ_CONTEXTS record. The test uses the LSM list from
> /sys/kernel/security/lsm to determine which format is expected.
> 
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> ---
>  tests/Makefile                   |   1 +
>  tests/multiple_contexts/Makefile |  12 +++
>  tests/multiple_contexts/test     | 166 +++++++++++++++++++++++++++++++
>  3 files changed, 179 insertions(+)
>  create mode 100644 tests/multiple_contexts/Makefile
>  create mode 100755 tests/multiple_contexts/test
> 
> diff --git a/tests/Makefile b/tests/Makefile
> index a7f242a..f20f6b1 100644
> --- a/tests/Makefile
> +++ b/tests/Makefile
> @@ -18,6 +18,7 @@ TESTS := \
>  	file_create \
>  	file_delete \
>  	file_rename \
> +	multiple_contexts \

"context" is a bit ambiguous.  Could this be named something to indicate
a security context rather than any other sort, such as audit or user
context?

>  	filter_exclude \
>  	filter_saddr_fam \
>  	filter_sessionid \
> diff --git a/tests/multiple_contexts/Makefile b/tests/multiple_contexts/Makefile
> new file mode 100644
> index 0000000..c2a8e87
> --- /dev/null
> +++ b/tests/multiple_contexts/Makefile
> @@ -0,0 +1,12 @@
> +#
> +# Copyright (C) Intel Corporation, 2020
> +#
> +
> +TARGETS=$(patsubst %.c,%,$(wildcard *.c))
> +
> +LDLIBS += -lpthread
> +
> +all: $(TARGETS)
> +clean:
> +	rm -f $(TARGETS)
> +
> diff --git a/tests/multiple_contexts/test b/tests/multiple_contexts/test
> new file mode 100755
> index 0000000..c9afed5
> --- /dev/null
> +++ b/tests/multiple_contexts/test
> @@ -0,0 +1,166 @@
> +#!/usr/bin/perl
> +#
> +# Copyright (C) Intel Corporation, 2020
> +#
> +
> +use strict;
> +
> +use Test;
> +BEGIN { plan tests => 3 }
> +
> +use File::Temp qw/ tempdir tempfile /;
> +
> +###
> +# functions
> +
> +sub key_gen {
> +    my @chars = ( "A" .. "Z", "a" .. "z" );
> +    my $key   = "testsuite-" . time . "-";
> +    $key .= $chars[ rand @chars ] for 1 .. 8;
> +    return $key;
> +}
> +
> +###
> +# setup
> +
> +# reset audit
> +system("auditctl -D >& /dev/null");
> +
> +my $line;
> +my $lsm_out;
> +my $lsm_count = 0;
> +my $bpf_enabled = 0;
> +
> +open($lsm_out, "cat /sys/kernel/security/lsm |");
> +while ( $line = <$lsm_out> ) {
> +    if ( $line =~ /selinux/ ) {
> +        $lsm_count = $lsm_count + 1;
> +    }
> +    if ( $line =~ /smack/ ) {
> +        $lsm_count = $lsm_count + 1;
> +    }
> +    if ( $line =~ /apparmor/ ) {
> +        $lsm_count = $lsm_count + 1;
> +    }
> +    if ( $line =~ /bpf/ ) {
> +        $bpf_enabled = 1;
> +    }
> +}
> +close($lsm_out);
> +
> +if ( $lsm_count and $bpf_enabled ) {
> +    $lsm_count = $lsm_count + 1;
> +}
> +# create temp directory
> +my $dir = tempdir( TEMPLATE => '/tmp/audit-testsuite-XXXX', CLEANUP => 1 );
> +
> +# create stdout/stderr sinks
> +( my $fh_out, my $stdout ) = tempfile(
> +    TEMPLATE => '/tmp/audit-testsuite-out-XXXX',
> +    UNLINK   => 1
> +);
> +( my $fh_err, my $stderr ) = tempfile(
> +    TEMPLATE => '/tmp/audit-testsuite-err-XXXX',
> +    UNLINK   => 1
> +);
> +
> +###
> +# tests
> +
> +# create a test file
> +( my $fh, my $filename ) =
> +  tempfile( TEMPLATE => $dir . "/file-XXXX", UNLINK => 1 );
> +
> +# set the directory watch
> +my $key = key_gen();
> +system("auditctl -w $dir -k $key");
> +
> +# delete file
> +unlink($filename);
> +
> +# make sure the records had a chance to bubble through to the logs
> +system("auditctl -m syncmarker-$key");
> +for ( my $i = 0 ; $i < 10 ; $i++ ) {
> +    if ( system("ausearch -m USER | grep -q syncmarker-$key") eq 0 ) {
> +        last;
> +    }
> +    sleep(0.2);
> +}
> +
> +# test if we generate any audit records from the watch
> +my $result = system("ausearch -i -k $key > $stdout 2> $stderr");
> +ok( $result, 0 );
> +
> +# test if we generate a MAC_TASK_CONTEXTS record if and
> +# only if it is required.
> +#
> +# test if we generate a MAC_OBJ_CONTEXTS record if and
> +# only if it is required.
> +
> +my $found_auxsubj = 0;
> +my $found_subjattr = 0;
> +my $found_regsubj = 0;
> +
> +my $found_auxobj = 0;
> +my $found_objattr = 0;
> +my $found_regobj = 0;
> +
> +while ( $line = <$fh_out> ) {
> +
> +    if ( $line =~ / subj=\? / ) {
> +        $found_auxsubj = 1;
> +    } elsif ( $line =~ / subj=/ ) {
> +        $found_regsubj = 1;
> +    }
> +    if ( $line =~ / subj_selinux=/ ) {
> +        $found_subjattr = 1;
> +    }
> +    if ( $line =~ / subj_apparmor=/ ) {
> +        $found_subjattr = 1;
> +    }
> +    if ( $line =~ / subj_smack=/ ) {
> +        $found_subjattr = 1;
> +    }
> +
> +    if ( $line =~ / obj=\? / ) {
> +        $found_auxobj = 1;
> +    } elsif ( $line =~ / obj=/ ) {
> +        $found_regobj = 1;
> +    }
> +    if ( $line =~ / obj_selinux=/ ) {
> +        $found_objattr = 1;
> +    }
> +    if ( $line =~ / obj_apparmor=/ ) {
> +        $found_objattr = 1;
> +    }
> +    if ( $line =~ / obj_smack=/ ) {
> +        $found_objattr = 1;
> +    }
> +}
> +
> +# three cases:
> +# no subj= field or MAC_TASK_CONTEXTS when no supplying LSM
> +# subj=$value field, no MAC_TASK_CONTEXTS for exactly one supplying LSM
> +# subj=? field and a MAC_TASK_CONTEXTS for more than one supplying LSM
> +#
> +if ($lsm_count == 0) {
> +    ok($found_regsubj == 0 and $found_auxsubj == 0);
> +} elsif ($lsm_count == 1) {
> +    ok($found_regsubj and $found_auxsubj == 0);
> +} else {
> +    ok($found_subjattr and $found_auxsubj);
> +}
> +
> +if ($lsm_count == 0) {
> +    ok($found_regobj == 0 and $found_auxobj == 0);
> +} elsif ($lsm_count == 1) {
> +    ok($found_regobj and $found_auxobj == 0);
> +} else {
> +    ok($found_objattr and $found_auxobj);
> +}
> +
> +###
> +# cleanup
> +
> +system("auditctl -D >& /dev/null");
> +
> -- 
> 2.24.1
> 
> 

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

