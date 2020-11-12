Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 90ABB2AFC04
	for <lists+linux-audit@lfdr.de>; Thu, 12 Nov 2020 02:31:50 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-DcVM5ExsMs-2qdgM4guZMQ-1; Wed, 11 Nov 2020 20:31:47 -0500
X-MC-Unique: DcVM5ExsMs-2qdgM4guZMQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F81087951B;
	Thu, 12 Nov 2020 01:31:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AE931002C02;
	Thu, 12 Nov 2020 01:31:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2DD84180954D;
	Thu, 12 Nov 2020 01:31:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AC1VXP0027568 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 11 Nov 2020 20:31:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CDBB72156A52; Thu, 12 Nov 2020 01:31:33 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD1A02156A4C
	for <linux-audit@redhat.com>; Thu, 12 Nov 2020 01:31:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A66F9185A794
	for <linux-audit@redhat.com>; Thu, 12 Nov 2020 01:31:30 +0000 (UTC)
Received: from sonic302-26.consmr.mail.ne1.yahoo.com
	(sonic302-26.consmr.mail.ne1.yahoo.com [66.163.186.152]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-428-FuwkhMlBPvWyNFq4F0p9cQ-1;
	Wed, 11 Nov 2020 20:31:28 -0500
X-MC-Unique: FuwkhMlBPvWyNFq4F0p9cQ-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1605144687; bh=VKr3rw0FOTRSX3hjOsnYVnJh7jocvStk5QZNue9VRBs=;
	h=To:From:Subject:Date:From:Subject;
	b=If7soRoSwQTKL1XWgBUxVXrCjN+JXnpbTcqxivwSfn7JrNLdtiuRIu4y1U49jQ88e2NjbzP+Ylysy7syJ7mgNZKlzPXthcARyb93a37FH3qMt3VLsvsmHAilLn+GmCteau1IOqnxDf1j42JlRC6HNi0agQiPaKwQTUvZP1mNE7eRzvQYhQ8W5+LcUHxRYu/0IietuTJZMSsZxayBsRNiHXoE2e6WtjmFgmuC0CJmEzOUALZM+8K5Gk3+qZLweWnYTJqPJ4jBwIBDE6MuE/siHKrQsgRurIRMJuq/hfcFc3o8rEOYMurKo5Gp9G09sPK9AvMXF43caoaGfZOO1L2ikA==
X-YMail-OSG: bmcu874VM1nGUddsAa0ou.SDmpWSZP8Ld2ifroMV1R0sHnfbmaNXTtyUYUeSnb1
	ex8kqSqZhcGKV0BJ3Zn03dFb858aeLTz6ilODufZWEcSGdLmF.Zh6F9iyr3tklsm6Zra_WM76iAh
	wW52VKElI2IqgWToha4dh9Xd2cJW8AQfVQ9PV53i5iNGK2IdZQy00FLsPsr7mq_JuLVUdqw.F5a8
	x98dkp8m7WC5cbU31_TmXgfGHgbyIJl_34WAqLjp9jlvp7kI0bHVSVdvV6Ozf6IWtvdd6Mh39IDA
	aJDFuuPubj.i9HhuY2ukyAGEXjw0zn_wl115rRhXEnYGEfH49loj9ZX6qBhhmVB9Pafzzn64FHyv
	hjfqBZ_yk7OGLamcFDJMHcXySOJPLvQ8Xb8H1jnE0RSg87K1IFvusaIKDMnQzmE8cqEsN_AVjfNK
	sOksHXh6J.gM6E751ZuTOerZsOiDmRnMEsWzvHeCsaBQCKvd0Ls.4Gz5eBO8VTPN3gx0Q4uRKn3p
	tuGqNGvqtp9lsijnEENEuU5piY8DLuZe4RUD8Zt_petl.rFw3fr.89R7eoDbsL4pNFiQWBKWI82w
	S4aqAzrnkiR4SuWIt.jshanFBR5XkN1OR4vaF68e23rZvzkgvO7bYDgAlVc9Y.STfZVI9xAT7hyN
	.fBg1FM6LSSUHel9HE4riCMFAw1h7E2r8X9HeKdLFn0VIvM6AirrpQa7sCpQesMLdADiJM6nlMdj
	Ca3.mtNrJDWnFetfgke3n19LX8fdDawny._QIpNjSGX94wlNSgB0H.6cKJ02xK1ITmP4QIxNuDLi
	NAmAjxWe8t2QIdZLtCJYh2O4IzGjmXOEUvV03BWuixFR3c9IzbNzjMzwzPM6L_mrPkpXlirUcd9_
	KMOC7iwVyuzL3SQIt.rGvDZWzmcdmL0sw6o8IHfnExUUrWG0dxCGQvLQrQgC3oYDuJw0D66AbC1g
	OJ8iwjFQ_4WtSghJUVIsAlrkci8nbknG8gYLJQOsrD9lpQPF6jspnZMXsBNNofJUsTsiweOh1Gm_
	XmPgQqYBjouSvPgjhe6XQlPP9qPtLnJU3mHarP.2GbL_Kdew19cnsaZkKPUfwVwCclAJbrRdvart
	Pmt_dUzRuzhJ0f11RnZDAdoveUmJ8VKP.m5.Jd2Hayax1eXSCBpDzHjtKU.6YbYZcH8v40CKz7Hy
	T1qhTCNbr5zthkqtwjPac.v4dcP0W2Cc24yDkjPA78iQg1E_7T4zjj9uRURCwJnqhq9dY38tCklE
	XPiglB2H5GECJ9pTkiBEk_lmLphA9ZKW_TglhjamAA1d1zMSkvkyc11BghaR9VBEzUZKHP7bjYLe
	5YH2drO_6NpkIfdVbzyJd._HaDqYYoHBUX6m0hXd4aM8K7U40oX4j3iYV5eDleIEgn2iBTWtlBnI
	X9L94peiUjRMCwlRK49PKpKa7uqAH.VvwVEo1CCKlSwWsBj9nDliRruHgmnrIzPo7_bkXYGPpq4Z
	wE3N7FS3ZyB.RMgYm5p.fs9DIK1dd2JeSsqrzO2XfwvaRAxDrtja3A73LZZTpYHNEpFB2o1Wirro
	UJf4_xUGdGmPV1YXqlEJRyg39uuNuEoOEVFelpPm4h1OJH_bSoH8BHW.40OC1nyA7t913Ax_rGP4
	C6HKdQx.p78TJeFC3.C1VCj5.y27ogUyvQmbY.xjVF8Nc5oeNEwxm5MfbteN72Hdi_iD_4u2ANq_
	or3SSR.XDnfbI_HSy0f.iE8GbTSFR5PFXiYolk4_sQGcZcRUI1w5esOqObsKu8z_I2dOqV47HPB4
	FI1mypGmt4sFb0wsIHtPlPuNIkUc2JsWqTwxg4yRGw1PF1JRnhBTiXjeqZuc0lNMR.CSu70Q7sAC
	wZwRHo1w.XNiB8Bn.neH89PD1m9G5PzXs80vCmNfTUK91EdLqZ0qt25zjR_EyJDa1aC0R7S28mXx
	m01OGRmU6h6QvGB2niQyCEg7nGyza7PjRU7q_cqiETpcomRGe1Rc9qIaAD.vXa5tsdEZR6uaiUPt
	gJRRFtLL23LcUAlwgC4x6lIgb_5TrF2N0vuvMenK87lfcPh50cZWtRgkKqgm99DIt3tB0vUuRA9a
	gN31Yui37v72LgEVDVoCjR3IwnVpABCzPKIDWYYIkcXG6DqzVBIsSbJCwbvpMGTcBQl_8D5ef1tJ
	XFZaLcqV9_Xcv1NCE_.8_x1YBQRksuEySLo81owUDwf7UxhLLJb1v0SUsajflpFTGMP_feFXizE.
	WMNAj9Wiq9RAyrcJCO_inEuiIiCyBeL0lr2ubsWacmjETo25XVwoJBVJQ4w.YQ_5zKCgW5XMGVjT
	nohFGVGFGMdoGh6xZXdhqgwdIKxQZoQr3QNZp6Spmnjm31rNMDZpm9s10kwK1Ex6JZMAtiKJhAnJ
	n_Aal2EQZcYYPmGb5OiTgK6LcPVqKfE9o98Tz7b2Pu1ha5g4C.WlU0zdct6ARrQb3NjqZ.xFPsQ8
	iK1bL6Ut9SLkcxrypU.3Yf2Npb26S0ctyz4emyT7x02Hlclmo0BRgjsPYMCbWEftq0V0DyrJ4tio
	p_aFjBbmp7u7g1R3xlP1XCsN.ULbO7_tUZdiBuTstyMWHMjDfd8Bp28ajREZXRSWaOvvfxNEHOHA
	.jA6X6KwJttvLXjH9yWltc2q18aWsCxv3b50Dw.8genNNhtNXJgJcWk1egmAb63ZSNt3GFCwiFiX
	PgGGTuTbxz.SD8SjUeHm_ok6QWPE.jrC0d5zH_y2AWpJzqo4e3E0M_1xXsvhT30G0FszRT5jOIGH
	GqLoS.hZoqAhZfOrXiR..pBk8rHmqeTPI5DNx8BsesgmOywBojIZVTqNONJNcFk1ByfDNcGnjI3W
	g
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic302.consmr.mail.ne1.yahoo.com with HTTP;
	Thu, 12 Nov 2020 01:31:27 +0000
Received: by smtp409.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 2fc4b1841cc9953cc5aa01f6bca3e0a7; 
	Thu, 12 Nov 2020 01:31:24 +0000 (UTC)
To: "linux-audit@redhat.com" <linux-audit@redhat.com>,
	Paul Moore <paul@paul-moore.com>, Richard Guy Briggs <rgb@redhat.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Subject: [PATCH] audit-testsuite: tests for subject and object correctness
Message-ID: <e7be279c-0599-8dbd-5dd8-8fc8d0931b2e@schaufler-ca.com>
Date: Wed, 11 Nov 2020 17:31:23 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.4.1
MIME-Version: 1.0
References: <e7be279c-0599-8dbd-5dd8-8fc8d0931b2e.ref@schaufler-ca.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Verify that there are subj= and obj= fields in a record
if and only if they are expected. A system without a security
module that provides these fields should not include them.
A system with multiple security modules providing these fields
(e.g. SELinux and AppArmor) should always provide "?" for the
data and also include a AUDIT_MAC_TASK_CONTEXTS or
AUDIT_MAC_OBJ_CONTEXTS record. The test uses the LSM list from
/sys/kernel/security/lsm to determine which format is expected.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 tests/Makefile               |   1 +
 tests/multiple_lsms/Makefile |  12 +++
 tests/multiple_lsms/test     | 166 +++++++++++++++++++++++++++++++++++
 3 files changed, 179 insertions(+)
 create mode 100644 tests/multiple_lsms/Makefile
 create mode 100755 tests/multiple_lsms/test

diff --git a/tests/Makefile b/tests/Makefile
index a7f242a..253e906 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -18,6 +18,7 @@ TESTS := \
 	file_create \
 	file_delete \
 	file_rename \
+	multiple_lsms \
 	filter_exclude \
 	filter_saddr_fam \
 	filter_sessionid \
diff --git a/tests/multiple_lsms/Makefile b/tests/multiple_lsms/Makefile
new file mode 100644
index 0000000..c2a8e87
--- /dev/null
+++ b/tests/multiple_lsms/Makefile
@@ -0,0 +1,12 @@
+#
+# Copyright (C) Intel Corporation, 2020
+#
+
+TARGETS=$(patsubst %.c,%,$(wildcard *.c))
+
+LDLIBS += -lpthread
+
+all: $(TARGETS)
+clean:
+	rm -f $(TARGETS)
+
diff --git a/tests/multiple_lsms/test b/tests/multiple_lsms/test
new file mode 100755
index 0000000..c9afed5
--- /dev/null
+++ b/tests/multiple_lsms/test
@@ -0,0 +1,166 @@
+#!/usr/bin/perl
+#
+# Copyright (C) Intel Corporation, 2020
+#
+
+use strict;
+
+use Test;
+BEGIN { plan tests => 3 }
+
+use File::Temp qw/ tempdir tempfile /;
+
+###
+# functions
+
+sub key_gen {
+    my @chars = ( "A" .. "Z", "a" .. "z" );
+    my $key   = "testsuite-" . time . "-";
+    $key .= $chars[ rand @chars ] for 1 .. 8;
+    return $key;
+}
+
+###
+# setup
+
+# reset audit
+system("auditctl -D >& /dev/null");
+
+my $line;
+my $lsm_out;
+my $lsm_count = 0;
+my $bpf_enabled = 0;
+
+open($lsm_out, "cat /sys/kernel/security/lsm |");
+while ( $line = <$lsm_out> ) {
+    if ( $line =~ /selinux/ ) {
+        $lsm_count = $lsm_count + 1;
+    }
+    if ( $line =~ /smack/ ) {
+        $lsm_count = $lsm_count + 1;
+    }
+    if ( $line =~ /apparmor/ ) {
+        $lsm_count = $lsm_count + 1;
+    }
+    if ( $line =~ /bpf/ ) {
+        $bpf_enabled = 1;
+    }
+}
+close($lsm_out);
+
+if ( $lsm_count and $bpf_enabled ) {
+    $lsm_count = $lsm_count + 1;
+}
+# create temp directory
+my $dir = tempdir( TEMPLATE => '/tmp/audit-testsuite-XXXX', CLEANUP => 1 );
+
+# create stdout/stderr sinks
+( my $fh_out, my $stdout ) = tempfile(
+    TEMPLATE => '/tmp/audit-testsuite-out-XXXX',
+    UNLINK   => 1
+);
+( my $fh_err, my $stderr ) = tempfile(
+    TEMPLATE => '/tmp/audit-testsuite-err-XXXX',
+    UNLINK   => 1
+);
+
+###
+# tests
+
+# create a test file
+( my $fh, my $filename ) =
+  tempfile( TEMPLATE => $dir . "/file-XXXX", UNLINK => 1 );
+
+# set the directory watch
+my $key = key_gen();
+system("auditctl -w $dir -k $key");
+
+# delete file
+unlink($filename);
+
+# make sure the records had a chance to bubble through to the logs
+system("auditctl -m syncmarker-$key");
+for ( my $i = 0 ; $i < 10 ; $i++ ) {
+    if ( system("ausearch -m USER | grep -q syncmarker-$key") eq 0 ) {
+        last;
+    }
+    sleep(0.2);
+}
+
+# test if we generate any audit records from the watch
+my $result = system("ausearch -i -k $key > $stdout 2> $stderr");
+ok( $result, 0 );
+
+# test if we generate a MAC_TASK_CONTEXTS record if and
+# only if it is required.
+#
+# test if we generate a MAC_OBJ_CONTEXTS record if and
+# only if it is required.
+
+my $found_auxsubj = 0;
+my $found_subjattr = 0;
+my $found_regsubj = 0;
+
+my $found_auxobj = 0;
+my $found_objattr = 0;
+my $found_regobj = 0;
+
+while ( $line = <$fh_out> ) {
+
+    if ( $line =~ / subj=\? / ) {
+        $found_auxsubj = 1;
+    } elsif ( $line =~ / subj=/ ) {
+        $found_regsubj = 1;
+    }
+    if ( $line =~ / subj_selinux=/ ) {
+        $found_subjattr = 1;
+    }
+    if ( $line =~ / subj_apparmor=/ ) {
+        $found_subjattr = 1;
+    }
+    if ( $line =~ / subj_smack=/ ) {
+        $found_subjattr = 1;
+    }
+
+    if ( $line =~ / obj=\? / ) {
+        $found_auxobj = 1;
+    } elsif ( $line =~ / obj=/ ) {
+        $found_regobj = 1;
+    }
+    if ( $line =~ / obj_selinux=/ ) {
+        $found_objattr = 1;
+    }
+    if ( $line =~ / obj_apparmor=/ ) {
+        $found_objattr = 1;
+    }
+    if ( $line =~ / obj_smack=/ ) {
+        $found_objattr = 1;
+    }
+}
+
+# three cases:
+# no subj= field or MAC_TASK_CONTEXTS when no supplying LSM
+# subj=$value field, no MAC_TASK_CONTEXTS for exactly one supplying LSM
+# subj=? field and a MAC_TASK_CONTEXTS for more than one supplying LSM
+#
+if ($lsm_count == 0) {
+    ok($found_regsubj == 0 and $found_auxsubj == 0);
+} elsif ($lsm_count == 1) {
+    ok($found_regsubj and $found_auxsubj == 0);
+} else {
+    ok($found_subjattr and $found_auxsubj);
+}
+
+if ($lsm_count == 0) {
+    ok($found_regobj == 0 and $found_auxobj == 0);
+} elsif ($lsm_count == 1) {
+    ok($found_regobj and $found_auxobj == 0);
+} else {
+    ok($found_objattr and $found_auxobj);
+}
+
+###
+# cleanup
+
+system("auditctl -D >& /dev/null");
+
-- 
2.24.1


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

