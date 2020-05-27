Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2F1151E4F28
	for <lists+linux-audit@lfdr.de>; Wed, 27 May 2020 22:23:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590611003;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xRqYb7GAImg9Ks63RCWrQg9OcG/W/HbPPqZgO7yp6QU=;
	b=XV/DQi8E+jlKj4LEOdOpC+OPKiKdS0DZlzh4lfbVgULjwV5moZ6oAm1aGeJO3LumE3XSHS
	7pyD7zDJZbdVcOgWsB9cBLvn1K8VPAB1Pv7dk804wFOdhTm0xz237S6ZOV1efuOfhgMivB
	awpwB6luJx2MreJpTIO9msvzoGadiHM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-ke-aV9agOxe5Ynx4TetUkg-1; Wed, 27 May 2020 16:23:20 -0400
X-MC-Unique: ke-aV9agOxe5Ynx4TetUkg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D57D1005512;
	Wed, 27 May 2020 20:23:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 009325D9E5;
	Wed, 27 May 2020 20:23:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E79B41809541;
	Wed, 27 May 2020 20:23:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04RKMo1O011391 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 16:22:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 72FDB10013D7; Wed, 27 May 2020 20:22:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-113-158.phx2.redhat.com [10.3.113.158])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 83E0B1001268;
	Wed, 27 May 2020 20:22:47 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Vishnu Srinivasa Ramaprasad <srvishnu123@gmail.com>
Subject: Re: What value gets stored in a3 when -S execve?
Date: Wed, 27 May 2020 16:22:45 -0400
Message-ID: <4000710.EZmUHuUpmd@x2>
Organization: Red Hat
In-Reply-To: <CAKLd27D7ts_1Orymr50D-qZHhmxs7Jkbb4uh660nCoH4n4WG_w@mail.gmail.com>
References: <CAKLd27D7ts_1Orymr50D-qZHhmxs7Jkbb4uh660nCoH4n4WG_w@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

On Wednesday, May 27, 2020 3:44:13 PM EDT Vishnu Srinivasa Ramaprasad wrote:
> I'm Vish and I am a newbie to auditd. My requirement is to log only
> shell/bash commands and custom commands executed by administrator users.
> I have created these rules in /etc/audit/rules.d/audit.rules, to ensure
> SYSCALL, EXECVE are being added to audit.log for administrator users with
> auid greater than 1000:
> -a exit,always -F arch=b64 -S execve -F auid>=1000 -F auid!=-1 -k log_cmd
> -a exit,always -F arch=b32 -S execve -F auid>=1000 -F auid!=-1 -k log_cmd
> 
> After restarting auditd service, I had executed strace on a simple command
> which will display version of my project's toolkit:
> 
> ~# strace -e trace=execve toolkit-version-show
> execve("/var/tmp/toolkit-version-show", ["toolkit-version-show"],
> 0x7ffef1fa38b0 /* 30 vars */) = 0
> Toolkit Version: 1.01
> +++ exited with 0 +++
> 
> Later, I executed the ausearch command to check the log entry:
> ~# ausearch -i --start recent
> ----
> type=EXECVE msg=audit(05/27/2020 19:01:26.605:12725) : argc=2
> a0=/usr/bin/perl a1=/var/tmp/toolkit-version-show
> type=SYSCALL msg=audit(05/27/2020 19:01:26.605:12725) : arch=x86_64
> syscall=execve success=yes exit=0 a0=0x7ffef1fa2450 a1=0x7ffef1fa38a0
> a2=0x7ffef1fa38b0 a3=0x7f47f8669740 items=3 ppid=3641 pid=3643
> auid=administrator uid=root gid=root euid=root suid=root fsuid=root
> egid=root sgid=root fsgid=root tty=pts0 ses=8936 comm=toolkit-version-sho
> exe=/usr/bin/perl key=log_cmd
> ----
> type=EXECVE msg=audit(05/27/2020 19:01:26.601:12724) : argc=4 a0=strace
> a1=-e a2=trace=execve a3=toolkit-version-show
> type=SYSCALL msg=audit(05/27/2020 19:01:26.601:12724) : arch=x86_64
> syscall=execve success=yes exit=0 a0=0x55a2d44c9010 a1=0x55a2d449fe80
> a2=0x55a2d4389490 a3=0x8 items=2 ppid=3099 pid=3641 auid=administrator
> uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root
> fsgid=root tty=pts0 ses=8936 comm=strace exe=/usr/bin/strace key=log_cmd
> ----
> 
> My understanding of a0 - a2: Please refer the syntax of execve() :
> 
> int execve(const char*filename, char *const argv[], char *const envp[]);
> 
> Based on syntax of execve() and output from strace, I could understand that
> in audit.log event entry:
> a0=0x7ffef1fa2450 represents filename argument of execve

It a pointer to the string.

> a1=0x7ffef1fa38a0 represents argv[] argument of execve
> a2=0x7ffef1fa38b0 represents envp[] argument of execve
> 
> Question  1:  What does the a3=0x7f47f8669740  value represent?

whatever is on the stack in that position.

> As execve() has only 3 arguments (represented by a0,a1,a2), what value gets
> stored in a3?
> I have noticed a3 values to be varying from:
> a3=0x0
> a3=0x7
> a3=0x55a2d4389490
> a3=0x56a2d44adc00
> a3=0x8
> 
> Question 2: a3=0x8 seems to be the value assigned for a majority of
> execve() syscalls.
> Is this a standard value set in case of main/primary system call, such as
> toolkit-version-show?

Nope. It depends entirely on what the previous syscalls or system activity 
were and where on the stack it currently is.

> Could I use this in a rule filter *-F a3=8* to log only primary (custom
> script) command executed by user and not internal commands executed by
> custom script like ls, cat, grep.. etc.:
> -a exit,always -F arch=b64 -S execve *-F a3=8* -F auid>=1000 -F auid!=-1 -k
> log_cmd
> -a exit,always -F arch=b32 -S execve *-F a3=8* -F auid>=1000 -F auid!=-1 -k
> log_cmd
> 
> Would I miss logging a few primary syscalls, if a3 is not 0x80 in some
> cases?

Nope. you can't count on anything in a3 since it is not valid for that 
syscall.

> Question 3: If a3=0x8 is not a standard value, Is it possible to identify
> primary custom command and log only that command, and not internal commands
> with a3=0x0 or a3=0x55a2d4389490?

You can always place a watch on the custom commands.
-a exit,always -F path=/path-to/custom-command -F perm=x -F key=command


> Question 4: Is it possible to filter out and not log syscalls with
> tty=(none)?

No. But there is a loose correlation with auid or sessionid being -1. That 
means it is a daemon. And if you only want commands run by people, then you 
want -F auid>=1000 -F auid!=-1.

-Steve



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

