Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 09EB12A362A
	for <lists+linux-audit@lfdr.de>; Mon,  2 Nov 2020 22:55:31 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528--a0BVdw8Mt-IaqT6Sjzf7w-1; Mon, 02 Nov 2020 16:55:28 -0500
X-MC-Unique: -a0BVdw8Mt-IaqT6Sjzf7w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B7E0809DCD;
	Mon,  2 Nov 2020 21:55:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CB045D9D2;
	Mon,  2 Nov 2020 21:55:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5881E181A270;
	Mon,  2 Nov 2020 21:54:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A2LsjUF015847 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 2 Nov 2020 16:54:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 744782144B34; Mon,  2 Nov 2020 21:54:45 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DC012144B32
	for <linux-audit@redhat.com>; Mon,  2 Nov 2020 21:54:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFE7D80351B
	for <linux-audit@redhat.com>; Mon,  2 Nov 2020 21:54:41 +0000 (UTC)
Received: from sonic301-38.consmr.mail.ne1.yahoo.com
	(sonic301-38.consmr.mail.ne1.yahoo.com [66.163.184.207]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-500-8tE9AK2DPASRCwb_kE0Uaw-1;
	Mon, 02 Nov 2020 16:54:39 -0500
X-MC-Unique: 8tE9AK2DPASRCwb_kE0Uaw-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1604354078; bh=aqH1z1zOm0MhgApuKKWszqDTdgGZKF/OfJBYaltlWP0=;
	h=To:From:Subject:Date;
	b=oQIhSCAv8e3hNvmYJraiI08NLsUZn5ReG+9K8LQx3DMEKoCsB/eY+08eFYSjv8qThBtFKunWw49PaeAs2kjAWjqrpGrNd6FW+T4odlzT2gQd4mvld5cpmblL2Om4KSJQ9YSNELR6L+9FwuUYhzk+SC3UAoSZDx67TeRahnspU2E77iN0hdahbSl6APbAcGrkR84wEieUmBbJpPvKJUM5VyouYn57opb5udDHQUFneo1aUNTyvp1z1AXz+3Zui93HDtuerwIQv8xCCCwuCpH98l9qk6bPSvG8vijUkGDl/maarUFxdFaF5ATcquN5MeElaqpioNWZcnqsdAS4jHMPsQ==
X-YMail-OSG: mjFYVr8VM1lOYiVNQNKBNpHaFXl5911fL4oV73Ig2Mw_XGKyQwd6GPiM.HJAtrN
	jCx2_JtD9aqpvNzcBHoDXgW3Ugwma3eEStzEFTpN.7IpBWOn22F6PVibEn4xoUEJcAr3UCljekbr
	GM0wrymCb9RkwX6F6wU62.lNHfk.m3DnOn4sCRmYCYr5zOH9wwE1orgUkoL5iXsXcL0PcMWz8WC_
	PoTlSi7ID2lefxUXtPfywXb7eZnCrbeLpeVCvZt.xyH3o0vJy4xTKnmo0UfI75NIFYb3SXj4Vi_n
	_ovQ8xCtvhu8sAhFT6XxOiZun0RfaWRGBuLSlvpE0fRxLQE3s3Y21foMI7wcfcIXlLBZK68K6_U5
	naHV4rt2oFuPWpki12EwHmNtcJSO2T8pnlVtDaxGfnaQg48MSuq5fp5Nf1biB6zrHT0e6kfKQBUg
	Uzz5JVTrHeZry45F6hleKDzksYRajS.J5A7dn7SbGgrhEjSqOrHHWLgTQmt0IA9UTPqOPmg59LPz
	nmyzgxvS9sKf.ENZVnp5Cc9xFlk.8td1MBjoLsWsGqnmiJBav6W6s1nU8615OuNNKTFHOjaak2Iu
	I7vnZRkDhYlbAlALw1vSy3_PG_c3qemNzvOBvXrRT2AwesTxBgV20z8VDe_.sxbqGX02HdKr1zLr
	NAlJPMft7_WEgL5nSCJmTm8vcQhf9P24iHG2TVST9yUU29Q9vSMg1Xk.qa6dLde0Bcr9cMK91PzQ
	GzSib.NncZsc9ooazblxNhBjB5e0FoyErKlAK0jSrcw2xum.su7vHXkd1.kCT.YBDZrB2onKKP8D
	qgdFHGwV2Rw.Mk5ccJkwscVfq5Qp..XAbu17Jq5RBReD7NV0lSblBKAL0TBsfNpkO3qlppQ3askZ
	.HLmTipvio7C8VXaonuN2UoB2hHiWulxd4B.JtV1V4Zvzcgrn9m7knvJIlssTGp9zSP9QwCbtjxW
	qQP.hd.BR1nZgCtWBOliebtrxXcuL_hvJpT5ZeZdaOP5TsQ4fCmK6YGdB_hLG9cDmNlWWCeDtp.l
	z6wIVJ7Ux23HzlS.scsE0jzxl60RpuhK_D9LUHly23K8ztELJQvoAMG5euRP8mZtJ16mj0mpHw70
	KcYvCjKkzqKjT29sXkjRfdZQ3OotQPZtGm7RRV0MBBbLVE8qYSoZlXaSqNUvjyDaS46RP.VJKZ9w
	ZK0vaK8tw50V8XDDPG3Pg8qnuAI588vWikJ0.k1_9I9O2VhfOtNbBeMX8KBBXkvScOcpfK80HrFP
	lovqTLxzlDoc5Gpxc3wFFXK3jqlOPfNk9ImKiqKuhkoIth5y.VCVfhym8fb_.d157VZM5btPiArf
	5I9UALNLVOEWfz7MFrFlcpHfZ7IrOaEPWlxHWxoeGPR6vWUmBk6sqJYM7GP4Metjv1ZoMa9zg8_x
	xz9ht.C_vJ48FKi0cNqZUilHJOL_fdUOSNoi4OMnA3QAuTCl.baCPttZC63AO4kJh5UsGgEna44G
	Bgd2dUUjrT1sfodKDxE3JIpfXo0AjST1O49dNIB8clJ.cBpAnqQa3gOhaC9UA_IWzC6gDpiecFLy
	CWdy9se4wr0OI84Ua2KRg94kOAEj51BktqefmKQ6_z1csgDnUZJwCE6HADJO.o2Z8Yys1KT2o5om
	mrjfG0kpNXUQRgUpltvbbbdLlQhx3adai833XgXj7kRY4kRTbz7zmvcsjTB7fpGA9s7OmOvChiSo
	mm0ROf6UyndC3DWQFPrTKRPs.z6.YqiyGvQx5NcIZPrASAnP.QNZMf.ypHGXKO22hIwi8vZdoU2i
	zpbinHO57bRQUodIxgoQadafrgk_iykisvuz0El6wTfU4YZ1iF79LnHrRfqMw1XclFotjeZR2OTF
	kkMHl9ewCI0VdHvj5PODUDD4x_o04I3N_x9E8jz3iUB8z52T4AiHWK2XqwJ8Lr2OCZRo8rGqE6Sj
	GyOJlv_KXXRbhi.jMvgy1nZ6gm_Dmu0FO9qnQ1YdOCz6KPwJZub1qi2XzyIi10c9EA9SfuAeKM92
	SNWcqdyWM05jLXsdEu4RZ8Mpv68aV9JC36w9fckaVOImny7kWgmhUAl.oUM203xuXzHMyc8CK_A9
	TaheO.RK60.0b_avo8_WmXWMixB6QflJe_uk1kwXSmyUEb9BOc5We2pZs1Fa2VMO4.chh.hNoe4p
	4WUvGfaMfwU1.a_7cXo4jzQMkZiEtcJmXXYBAqXCK5k4f57UO3nq.ZbC99yWZnf.Okr8jKYYjCFk
	V24GOrtD9hnJ6g2tRMpVhicSwbjhhoYLBdmwNZv7R7yDGwbaKTlGRYD7OZSwrvZ7w79.gElp6QWT
	6BbfeXpZTkriXOVGfkb5WihrpAluTpjho4IuKGHufw9ulmt8L.tOC9XQEni6czvbaveulVzfnf1W
	1B_3X1M2MyNN2I3_Jt7f6xqCB8QLLhWRqqx85SjzpLdXef3r0B5oXSarahIo9ucKK_Ezl_11QSwc
	KpVo_VMy5ZpUc6KnnHYbA1SvfiKZOITp_VuzvzrowWNXD2yohW3JJU3co5JFs9a4p9F1limr57D5
	3WCaajInUdAvcgfPj9Mg98voZpbfC_x7lsTUOQFtXxatlh.AodLD.6PmrcWVHDjXWcfzVWuN.4Q5
	rj5qlw2Uqha0yIIC8RRvsOfsuc7TdfUa2MMNKblmQV15mo2ZmSCDjWJc3Hrb.Ai_LXJ0kFdd_.eo
	Fvd2EFR.9W7ckK3xgTLUVQEcWd7ltIBuRr0XM4MVeigc6CvGE9jtYulC70gshQfDNC8U_0zBb2do
	i7zHG.87Wn1j9xC4oE69d7C8v9G8AldBQCNY0VXxGyAQk3uSYA.RP77Bad9RlJ5d967rvDFwm1hi
	dYI8mzu2c9A--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic301.consmr.mail.ne1.yahoo.com with HTTP;
	Mon, 2 Nov 2020 21:54:38 +0000
Received: by smtp419.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 5977330274bce5b68311db0871664165; 
	Mon, 02 Nov 2020 21:54:34 +0000 (UTC)
To: "linux-audit@redhat.com" <linux-audit@redhat.com>,
	Paul Moore <paul@paul-moore.com>, Richard Guy Briggs <rgb@redhat.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Subject: [RFC PATCH] audit-testsuite: tests for subject and object correctness
Message-ID: <e4bf30e2-a92f-99b7-30d0-3e3473e30399@schaufler-ca.com>
Date: Mon, 2 Nov 2020 13:54:32 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.4.0
MIME-Version: 1.0
References: <e4bf30e2-a92f-99b7-30d0-3e3473e30399.ref@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 tests/Makefile                   |   1 +
 tests/multiple_contexts/Makefile |  12 +++
 tests/multiple_contexts/test     | 166 +++++++++++++++++++++++++++++++
 3 files changed, 179 insertions(+)
 create mode 100644 tests/multiple_contexts/Makefile
 create mode 100755 tests/multiple_contexts/test

diff --git a/tests/Makefile b/tests/Makefile
index a7f242a..f20f6b1 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -18,6 +18,7 @@ TESTS := \
 	file_create \
 	file_delete \
 	file_rename \
+	multiple_contexts \
 	filter_exclude \
 	filter_saddr_fam \
 	filter_sessionid \
diff --git a/tests/multiple_contexts/Makefile b/tests/multiple_contexts/Makefile
new file mode 100644
index 0000000..c2a8e87
--- /dev/null
+++ b/tests/multiple_contexts/Makefile
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
diff --git a/tests/multiple_contexts/test b/tests/multiple_contexts/test
new file mode 100755
index 0000000..c9afed5
--- /dev/null
+++ b/tests/multiple_contexts/test
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

