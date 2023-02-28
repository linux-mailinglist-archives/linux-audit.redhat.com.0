Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 475E36A6218
	for <lists+linux-audit@lfdr.de>; Tue, 28 Feb 2023 23:04:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677621876;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=M3nDCWxNeb+hf4ZhRuMzUcyzMaZIQAXQulH7uANXVt4=;
	b=O0JDT/B18RUhepRfUyeWpOiJet1F0siAiti1Wi/Mukz3fMsnDVjrdR4mPz/a4ddgsJpmR6
	1/s1llsTM+caowKkx2C+NvTnjr8uA4u5h9shvK+DgvZs872a6u4WVDkKdtaoRYUUfsjgCp
	q0TiGiQVxbGqzwrPVqw1yCw8fWqo6mE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-HMzvoRxuP1GPUhftgRSyWA-1; Tue, 28 Feb 2023 17:04:34 -0500
X-MC-Unique: HMzvoRxuP1GPUhftgRSyWA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 038F387B2A1;
	Tue, 28 Feb 2023 22:04:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CF089140EBF6;
	Tue, 28 Feb 2023 22:04:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 20A0519465B1;
	Tue, 28 Feb 2023 22:04:22 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 911BE194658C for <linux-audit@listman.corp.redhat.com>;
 Tue, 28 Feb 2023 22:04:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 75862C15BAE; Tue, 28 Feb 2023 22:04:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E250C15BAD
 for <linux-audit@redhat.com>; Tue, 28 Feb 2023 22:04:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EC48382C964
 for <linux-audit@redhat.com>; Tue, 28 Feb 2023 22:04:20 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-583-OoHAkUu4OUquuVRta1qPxA-1; Tue, 28 Feb 2023 17:04:17 -0500
X-MC-Unique: OoHAkUu4OUquuVRta1qPxA-1
Received: by mail-pf1-f180.google.com with SMTP id u20so6729411pfm.7
 for <linux-audit@redhat.com>; Tue, 28 Feb 2023 14:04:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677621856;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WBdcEWTHOMgWII1SDCjRRm0jrKKWWdSRoqvCup+7P3M=;
 b=y68ljTiySsm3PwS9kX8Kg3yx2TCWTOwrt8+/TdN5N9E3bjt3EnIT5PUxXJ4DTF+7Zx
 L7BIZ04fVNDTDdXWpOF8p2F/Pm8wbG5saKHtB3XhaDU/Y7BEOL3c9czjo3PFL8disjjh
 FRY/afwXubS/8s3ITamoDZLmTpk7+QZqchae2dzp5eQxUD7/BjIBopKMA0619LDRHsu9
 6xBzBKqXgBMwFxTvsWjwU22pb6RVxRfjvpKUjSWFkNAJrrREqdYMNbTVNLwUp2bIupvK
 LZm37MS87GVMQ4e/RsaRsk9gGflQ03rH9BacZdrGfEfb9tsUD+QRaHfxN+EMVupPeeQX
 4jMQ==
X-Gm-Message-State: AO0yUKW8ZyqO+MfEJdlQp40cnIv7A3yzdJ/5nGbjxzrOKnf1fv7Z4p4Q
 ASwQ3vpE55R6aCibOTt85koyuRjQPJL2BUrWsacEt4GXKTwdJ5w=
X-Google-Smtp-Source: AK7set/WN9zUhqEknmHVhy9URGP8/w3jQGdhl6yDI6ldydP3ZxKFRaICUFQBFspSLy69s0wMHLlCsD4a8J/5c9YzbzU=
X-Received: by 2002:a63:788c:0:b0:503:20b9:5d88 with SMTP id
 t134-20020a63788c000000b0050320b95d88mr1334983pgc.4.1677621855707; Tue, 28
 Feb 2023 14:04:15 -0800 (PST)
MIME-Version: 1.0
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 28 Feb 2023 17:04:04 -0500
Message-ID: <CAHC9VhRMJq1gJPoR79AxM1JphmGtxhGMYBkd=Ptuaq3WBjX2Bw@mail.gmail.com>
Subject: audit userspace problems with io_uring async ops
To: linux-audit@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

We just recently started picking up audit-testsuite failures with the
latest upstream kernels and I tracked it down to a change in how the
IORING_OP_OPENAT operation is handled, and how Steve's audit userspace
displays async io_uring ops.  It appears that when ausearch is used to
look for events it doesn't display async io_uring events (URINGOP
records/events without an associated SYSCALL record/event).  Take the
following snippet from /var/log/audit/audit.log:

--- 287 ---
type=SYSCALL msg=audit(1677618568.199:287): arch=c000003e syscall=426
  success=yes exit=1 a0=4 a1=1 a2=0 a3=0 items=1 ppid=1498 pid=1499
  auid=0 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0
  tty=pts1 ses=3 comm="iouring" exe="/.../iouring"
  subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
  key="testsuite-1677618568-WJBbDxKg"ARCH=x86_64 SYSCALL=io_uring_enter ...
type=CWD msg=audit(1677618568.199:287):
  cwd="/root/sources/audit-testsuite/tests/io_uring"
type=PATH msg=audit(1677618568.199:287): item=0
  name="/tmp/iouring.4.txt" nametype=UNKNOWN ...
type=PROCTITLE msg=audit(1677618568.199:287):
  proctitle=2E2F696F7572696E670074315F6368696C64
--- 288 ---
type=URINGOP msg=audit(1677618568.199:288): uring_op=18 success=yes exit=0
  items=1 ppid=1498 pid=1499
  uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0
  subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
  key="testsuite-1677618568-WJBbDxKg"URING_OP=openat ...
type=CWD msg=audit(1677618568.199:288):
  cwd="/root/sources/audit-testsuite/tests/io_uring"
type=PATH msg=audit(1677618568.199:288): item=0 name="/tmp/iouring.4.txt"
  inode=33 dev=00:22 mode=0100644 ouid=0 ogid=0 rdev=00:00
  obj=unconfined_u:object_r:user_tmp_t:s0 nametype=NORMAL ...
--- 289 ---
type=SYSCALL msg=audit(1677618568.199:289): arch=c000003e syscall=426
  success=yes exit=0 a0=4 a1=0 a2=1 a3=1 items=0 ppid=1498 pid=1499
  auid=0 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0
  tty=pts1 ses=3 comm="iouring" exe="/.../iouring"
  subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
  key="testsuite-1677618568-WJBbDxKg"ARCH=x86_64 SYSCALL=io_uring_enter ...
type=PROCTITLE msg=audit(1677618568.199:289):
  proctitle=2E2F696F7572696E670074315F6368696C64

... and the matching ausearch output:

% ausearch -i -k "testsuite-1677618568-WJBbDxKg"
----
type=PROCTITLE msg=audit(02/28/2023 16:09:28.199:287) :
  proctitle=./iouring t1_child
type=PATH msg=audit(02/28/2023 16:09:28.199:287) : item=0
  name=/tmp/iouring.4.txt nametype=UNKNOWN ...
type=CWD msg=audit(02/28/2023 16:09:28.199:287) :
  cwd=/root/sources/audit-testsuite/tests/io_uring
type=SYSCALL msg=audit(02/28/2023 16:09:28.199:287) : arch=x86_64
 syscall=io_uring_enter success=yes exit=1 a0=0x4 a1=0x1 a2=0x0 a3=0x0 items=1
 ppid=1498 pid=1499 auid=root uid=root gid=root euid=root suid=root fsuid=root
 egid=root sgid=root fsgid=root tty=pts1 ses=3 comm=iouring exe=/.../iouring
 subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
 key=testsuite-1677618568-WJBbDxKg
----
type=PROCTITLE msg=audit(02/28/2023 16:09:28.199:289) :
 proctitle=./iouring t1_child
type=SYSCALL msg=audit(02/28/2023 16:09:28.199:289) : arch=x86_64
 syscall=io_uring_enter success=yes exit=0 a0=0x4 a1=0x0 a2=0x1 a3=0x1 items=0
 ppid=1498 pid=1499 auid=root uid=root gid=root euid=root suid=root fsuid=root
 egid=root sgid=root fsgid=root tty=pts1 ses=3 comm=iouring exe=/.../iouring
 subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
 key=testsuite-1677618568-WJBbDxKg
----

... if you look closely you'll notice that the #289 event (the async
URINGOP) is missing from the ausearch output.

The good news is that this is easily reproducible on current upstream
kernels and Steve's v3.1 audit userspace release using the
audit-testsuite io_uring tests.  This can also be seen in Rawhide with
current packages:

% uname -r
6.3.0-0.rc0.20230228gitae3419fb.9.1.secnext.fc39.x86_64
% rpm -q audit
audit-3.1-2.fc39.x86_64
% pwd
/root/sources/audit-testsuite/tests/io_uring
% git log --oneline | head -n 1
44c933e tests/filter_exclude: euid filtering now possible in exclude filter

Once ausearch is fixed we will also need to update the audit-testsuite
to add an explicit io_uring filter for the IORING_OP_OPENAT op.  The
patch below is untested (blocked on ausearch), but I expect it to
resolve the issue in the test suite:

>>>
diff --git a/tests/io_uring/test b/tests/io_uring/test
index 9eb427a..df13af0 100755
--- a/tests/io_uring/test
+++ b/tests/io_uring/test
@@ -49,6 +49,7 @@ system("auditctl -D >& /dev/null");
 # set our io_uring filters
 system("auditctl -a exit,always -F arch=b$abi_bits -S io_uring_setup -k $key");
 system("auditctl -a exit,always -F arch=b$abi_bits -S io_uring_enter -k $key");
+system("auditctl -a io_uring,always -S openat -k $key");

 # run the "t1" test
 system("$basedir/iouring t1");
>>>

For the kernel folks, the relevant commit is likely 0ffae640ad83
("io_uring: always go async for unsupported open flags").  I believe
what happened in the past is we caught the initial failing/-EAGAIN
io_uring op with the syscall record, e.g. #287 in the example above,
but now that IORING_OP_OPENAT goes straight to an async/io_wq op we
don't "see" it as ausearch isn't showing that (maybe needs to learn to
search URINGOP records too? dunno.).  Arguably this was always a
problem with the test, we just got a bit lucky because io_uring would
attempt to do IORING_OP_OPENAT synchronously at first.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

