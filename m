Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D9BBD4D7
	for <lists+linux-audit@lfdr.de>; Wed, 25 Sep 2019 00:18:26 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 32DAC3086211;
	Tue, 24 Sep 2019 22:18:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D7211001B00;
	Tue, 24 Sep 2019 22:18:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B3AC04E58C;
	Tue, 24 Sep 2019 22:18:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8OMIBXS019471 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 24 Sep 2019 18:18:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E4570100197A; Tue, 24 Sep 2019 22:18:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE5361001B00
	for <linux-audit@redhat.com>; Tue, 24 Sep 2019 22:18:09 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 891DD81DE0
	for <linux-audit@redhat.com>; Tue, 24 Sep 2019 22:18:08 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id r5so4173945qtd.0
	for <linux-audit@redhat.com>; Tue, 24 Sep 2019 15:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=from:subject:to:date:message-id:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=6SUbtIU2v+D6Yju69i+6pCECw0z02a9he4nj7UNmGvU=;
	b=UfhUfWcodyHgPMp0nUo/qcc/8Pdjro0tWvf2SR+Q7P9QlahbhCl7bSLkZwureJ1rxL
	2IDNQ5HamORiFozNXczT3A0zsNQeidv8sEctjrmSDxLoHs5eZ3xhM+CMc1A8YfmqGd1U
	4/e/Vz+Sn090/N4lYvbL/TwNuETzf2wcof1cCKMSONNJVCVIRKbWShFP65WbixjrMqO/
	ilY1wBnT1GLRU5Bk4TqVl3C4QIbJpkcD3huGfM6A9eIkGQJiwJWYvSUMaqMYcOm8YgFc
	0Yh+SbtoMAH2KzqlD6ef30QWUFGDIr391lLtwZVC4XVIO4d40+Kn9lW7iXPIMqTrMaqt
	0V5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:date:message-id:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=6SUbtIU2v+D6Yju69i+6pCECw0z02a9he4nj7UNmGvU=;
	b=Zixnq0IV4PHSEEtQtkozaiqsx5Os2MVwyko621J9eO6sm6reK6mO6CBOZRAv8DfjB+
	Sj2/Cg3sVdKVOlHFMy4TtVIyYMV/nelyVLJnoKZq+1SfjNwMfnMXlOwh9RFRUCJixPhf
	LTne/OlL9WuzjBtClZw0nB2TfsPi1z1AIh7dQ/NEIrz5gETnt3sQvzah0v7GYTW+s1w9
	baaKAlEsyrKXCnG7zYWoZuBST5jhJcCr4C1YsMKSqod8qIBZ8ayrlTV8A76OzLdibe/X
	kLj6pTDVOYGDG7UeYG8LHq/I/Fng1mFddTOKvDoM+7vt7Mz8pJCtpM2uFmZ4DWOmidkB
	fjqQ==
X-Gm-Message-State: APjAAAUhQ3OCETNb/faA0dz3+vOtlxmtO1bdPA09XUHsqzX8/Iq+UUrP
	zMKCZ0WacDE2hmkouIkDdT6qB5zmIg==
X-Google-Smtp-Source: APXvYqwokXiSM5gDf0dpo9HlMQYsRCk6C01YXXf4gdwZmSl5H+wCWbTt4AZze18gWKJxvfIHq+CG4Q==
X-Received: by 2002:ac8:710b:: with SMTP id z11mr5434388qto.372.1569363487262; 
	Tue, 24 Sep 2019 15:18:07 -0700 (PDT)
Received: from localhost (static-96-233-112-89.bstnma.ftas.verizon.net.
	[96.233.112.89]) by smtp.gmail.com with ESMTPSA id
	d205sm1640938qke.96.2019.09.24.15.18.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 24 Sep 2019 15:18:06 -0700 (PDT)
From: Paul Moore <paul@paul-moore.com>
X-Google-Original-From: Paul Moore <pmoore2@cisco.com>
Subject: [PATCH 2/2] audit-testsuite: fix the style according to
	./tools/check-syntax
To: linux-audit@redhat.com
Date: Tue, 24 Sep 2019 18:18:05 -0400
Message-ID: <156936348584.596476.12062813974120524062.stgit@chester>
In-Reply-To: <156936337513.596476.11307857211925574009.stgit@chester>
References: <156936337513.596476.11307857211925574009.stgit@chester>
User-Agent: StGit/0.19-dirty
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 24 Sep 2019 22:18:08 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Tue, 24 Sep 2019 22:18:08 +0000 (UTC) for IP:'209.85.160.196'
	DOMAIN:'mail-qt1-f196.google.com'
	HELO:'mail-qt1-f196.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.004  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_NONE) 209.85.160.196 mail-qt1-f196.google.com 209.85.160.196
	mail-qt1-f196.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Tue, 24 Sep 2019 22:18:25 +0000 (UTC)

From: Paul Moore <paul@paul-moore.com>

Signed-off-by: Paul Moore <paul@paul-moore.com>
---
 tests/exec_execve/test                       |    2 +-
 tests/exec_name/test                         |    2 +-
 tests/file_create/test                       |    2 +-
 tests/file_delete/test                       |    2 +-
 tests/file_rename/test                       |    2 +-
 tests/filter_exclude/test                    |    2 +-
 tests/filter_sessionid/test                  |    2 +-
 tests/login_tty/test                         |    2 +-
 tests/lost_reset/test                        |    2 +-
 tests/netfilter_pkt/test                     |    2 +-
 tests/syscall_module/test                    |    2 +-
 tests/syscall_socketcall/test                |    2 +-
 tests/syscalls_file/test                     |    2 +-
 tests/user_msg/test                          |    2 +-
 tests_manual/stress_tree/test                |    2 +-
 tests_manual/syscall_module_path_filter/test |    1 +
 16 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/tests/exec_execve/test b/tests/exec_execve/test
index 64260e7..7c119b8 100755
--- a/tests/exec_execve/test
+++ b/tests/exec_execve/test
@@ -15,7 +15,7 @@ $basedir =~ s|(.*)/[^/]*|$1|;
 
 sub key_gen {
     my @chars = ( "A" .. "Z", "a" .. "z" );
-    my $key = "testsuite-" . time . "-";
+    my $key   = "testsuite-" . time . "-";
     $key .= $chars[ rand @chars ] for 1 .. 8;
     return $key;
 }
diff --git a/tests/exec_name/test b/tests/exec_name/test
index f6d8ae4..95b0cc7 100755
--- a/tests/exec_name/test
+++ b/tests/exec_name/test
@@ -12,7 +12,7 @@ use File::Temp qw/ tempfile /;
 
 sub key_gen {
     my @chars = ( "A" .. "Z", "a" .. "z" );
-    my $key = "testsuite-" . time . "-";
+    my $key   = "testsuite-" . time . "-";
     $key .= $chars[ rand @chars ] for 1 .. 8;
     return $key;
 }
diff --git a/tests/file_create/test b/tests/file_create/test
index df3c293..8a75780 100755
--- a/tests/file_create/test
+++ b/tests/file_create/test
@@ -12,7 +12,7 @@ use File::Temp qw/ tempdir tempfile /;
 
 sub key_gen {
     my @chars = ( "A" .. "Z", "a" .. "z" );
-    my $key = "testsuite-" . time . "-";
+    my $key   = "testsuite-" . time . "-";
     $key .= $chars[ rand @chars ] for 1 .. 8;
     return $key;
 }
diff --git a/tests/file_delete/test b/tests/file_delete/test
index e12b248..3bde29c 100755
--- a/tests/file_delete/test
+++ b/tests/file_delete/test
@@ -12,7 +12,7 @@ use File::Temp qw/ tempdir tempfile /;
 
 sub key_gen {
     my @chars = ( "A" .. "Z", "a" .. "z" );
-    my $key = "testsuite-" . time . "-";
+    my $key   = "testsuite-" . time . "-";
     $key .= $chars[ rand @chars ] for 1 .. 8;
     return $key;
 }
diff --git a/tests/file_rename/test b/tests/file_rename/test
index 3b27abe..651aa3a 100755
--- a/tests/file_rename/test
+++ b/tests/file_rename/test
@@ -12,7 +12,7 @@ use File::Temp qw/ tempdir tempfile /;
 
 sub key_gen {
     my @chars = ( "A" .. "Z", "a" .. "z" );
-    my $key = "testsuite-" . time . "-";
+    my $key   = "testsuite-" . time . "-";
     $key .= $chars[ rand @chars ] for 1 .. 8;
     return $key;
 }
diff --git a/tests/filter_exclude/test b/tests/filter_exclude/test
index fd4b058..c734269 100755
--- a/tests/filter_exclude/test
+++ b/tests/filter_exclude/test
@@ -13,7 +13,7 @@ use Time::HiRes qw(usleep);
 
 sub key_gen {
     my @chars = ( "A" .. "Z", "a" .. "z" );
-    my $key = "testsuite-" . time . "-";
+    my $key   = "testsuite-" . time . "-";
     $key .= $chars[ rand @chars ] for 1 .. 8;
     return $key;
 }
diff --git a/tests/filter_sessionid/test b/tests/filter_sessionid/test
index 891293b..3c8fa6e 100755
--- a/tests/filter_sessionid/test
+++ b/tests/filter_sessionid/test
@@ -12,7 +12,7 @@ use File::Temp qw/ tempdir tempfile /;
 
 sub key_gen {
     my @chars = ( "A" .. "Z", "a" .. "z" );
-    my $key = "testsuite-" . time . "-";
+    my $key   = "testsuite-" . time . "-";
     $key .= $chars[ rand @chars ] for 1 .. 8;
     return $key;
 }
diff --git a/tests/login_tty/test b/tests/login_tty/test
index 442ee42..4b9cfae 100755
--- a/tests/login_tty/test
+++ b/tests/login_tty/test
@@ -12,7 +12,7 @@ use File::Temp qw/ tempdir tempfile /;
 
 sub key_gen {
     my @chars = ( "A" .. "Z", "a" .. "z" );
-    my $key = "testsuite-" . time . "-";
+    my $key   = "testsuite-" . time . "-";
     $key .= $chars[ rand @chars ] for 1 .. 8;
     return $key;
 }
diff --git a/tests/lost_reset/test b/tests/lost_reset/test
index 08a82c1..ce242e2 100755
--- a/tests/lost_reset/test
+++ b/tests/lost_reset/test
@@ -10,7 +10,7 @@ BEGIN { plan tests => 5 }
 
 sub key_gen {
     my @chars = ( "A" .. "Z", "a" .. "z" );
-    my $key = "testsuite-" . time . "-";
+    my $key   = "testsuite-" . time . "-";
     $key .= $chars[ rand @chars ] for 1 .. 8;
     return $key;
 }
diff --git a/tests/netfilter_pkt/test b/tests/netfilter_pkt/test
index 8dfe7f4..3efa8da 100755
--- a/tests/netfilter_pkt/test
+++ b/tests/netfilter_pkt/test
@@ -13,7 +13,7 @@ use File::Temp qw/ tempfile /;
 
 sub key_gen {
     my @chars = ( "A" .. "Z", "a" .. "z" );
-    my $key = "testsuite-" . time . "-";
+    my $key   = "testsuite-" . time . "-";
     $key .= $chars[ rand @chars ] for 1 .. 8;
     return $key;
 }
diff --git a/tests/syscall_module/test b/tests/syscall_module/test
index fe8e482..2ce4f17 100755
--- a/tests/syscall_module/test
+++ b/tests/syscall_module/test
@@ -12,7 +12,7 @@ use File::Temp qw/ tempfile /;
 
 sub key_gen {
     my @chars = ( "A" .. "Z", "a" .. "z" );
-    my $key = "testsuite-" . time . "-";
+    my $key   = "testsuite-" . time . "-";
     $key .= $chars[ rand @chars ] for 1 .. 8;
     return $key;
 }
diff --git a/tests/syscall_socketcall/test b/tests/syscall_socketcall/test
index 124d160..d30c7a1 100755
--- a/tests/syscall_socketcall/test
+++ b/tests/syscall_socketcall/test
@@ -15,7 +15,7 @@ $basedir =~ s|(.*)/[^/]*|$1|;
 
 sub key_gen {
     my @chars = ( "A" .. "Z", "a" .. "z" );
-    my $key = "testsuite-" . time . "-";
+    my $key   = "testsuite-" . time . "-";
     $key .= $chars[ rand @chars ] for 1 .. 8;
     return $key;
 }
diff --git a/tests/syscalls_file/test b/tests/syscalls_file/test
index 917449a..8aeadb7 100755
--- a/tests/syscalls_file/test
+++ b/tests/syscalls_file/test
@@ -12,7 +12,7 @@ use File::Temp qw/ tempdir tempfile /;
 
 sub key_gen {
     my @chars = ( "A" .. "Z", "a" .. "z" );
-    my $key = "testsuite-" . time . "-";
+    my $key   = "testsuite-" . time . "-";
     $key .= $chars[ rand @chars ] for 1 .. 8;
     return $key;
 }
diff --git a/tests/user_msg/test b/tests/user_msg/test
index 3a7cc9f..b0ef84d 100755
--- a/tests/user_msg/test
+++ b/tests/user_msg/test
@@ -12,7 +12,7 @@ use File::Temp qw/ tempdir tempfile /;
 
 sub key_gen {
     my @chars = ( "A" .. "Z", "a" .. "z" );
-    my $key = "testsuite-" . time . "-";
+    my $key   = "testsuite-" . time . "-";
     $key .= $chars[ rand @chars ] for 1 .. 8;
     return $key;
 }
diff --git a/tests_manual/stress_tree/test b/tests_manual/stress_tree/test
index 1b7c647..1b39d2d 100755
--- a/tests_manual/stress_tree/test
+++ b/tests_manual/stress_tree/test
@@ -12,7 +12,7 @@ use File::Temp qw/ tempdir tempfile /;
 
 sub key_gen {
     my @chars = ( "A" .. "Z", "a" .. "z" );
-    my $key = "testsuite-" . time . "-";
+    my $key   = "testsuite-" . time . "-";
     $key .= $chars[ rand @chars ] for 1 .. 8;
     return $key;
 }
diff --git a/tests_manual/syscall_module_path_filter/test b/tests_manual/syscall_module_path_filter/test
index c27c06b..46881fa 100755
--- a/tests_manual/syscall_module_path_filter/test
+++ b/tests_manual/syscall_module_path_filter/test
@@ -74,6 +74,7 @@ my $msgdate       = "";
 my $line2;
 seek( $fh_out, 0, 0 );
 seek( $fh_err, 0, 0 );
+
 while ( $line = <$fh_out> ) {
 
     # test if we generate any audit records from the filter rule

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
