Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 66C4C182528
	for <lists+linux-audit@lfdr.de>; Wed, 11 Mar 2020 23:45:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583966704;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SHBO9f77QNXbci1cUWp+6sWpKqjeFM8x/+yBTCRlSsM=;
	b=Sods13qhQIvgxDQPRH+ov2LeR1d3N88kx7bMy0MHPKFKfb01sbRRJAZO2uE/TJGckJhbMP
	YOqMYQaX2WHC9aAy00BftZNKcC2xHlvL3dzQRzKc7mMpkvuz9l94W3utNp4H1IID5nmnle
	U/hQer3+GAPiloJHrLi7dldHP+lxM3s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-fUD7l92lOzS7Pmo5OwLCDA-1; Wed, 11 Mar 2020 18:45:01 -0400
X-MC-Unique: fUD7l92lOzS7Pmo5OwLCDA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E0761005509;
	Wed, 11 Mar 2020 22:44:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF5CA10013A1;
	Wed, 11 Mar 2020 22:44:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D680F86A29;
	Wed, 11 Mar 2020 22:44:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02BMimbH027489 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 11 Mar 2020 18:44:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C7812100164D; Wed, 11 Mar 2020 22:44:48 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-75.phx2.redhat.com [10.3.116.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8EB1010013A1;
	Wed, 11 Mar 2020 22:44:45 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: Bitbake-type build question
Date: Wed, 11 Mar 2020 18:44:45 -0400
Message-ID: <2240313.dvXeWIBNYd@x2>
Organization: Red Hat
In-Reply-To: <CAMd7AX8ytYZeVdZxUb3RXpgqJdToN9Lj2KVOUN9m9WtZoaiVKQ@mail.gmail.com>
References: <CAMd7AX8ytYZeVdZxUb3RXpgqJdToN9Lj2KVOUN9m9WtZoaiVKQ@mail.gmail.com>
MIME-Version: 1.0
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wednesday, March 11, 2020 6:01:54 PM EDT Aaron Biver wrote:
> I'm attempting to cross-compile the 2.8 maintenance branch with petalinux,
> which uses bitbake yocto under the hood to build it, and I run it on a
> system V target which is a 64 bit arm architecture.  I'm seeing some errors
> when I attempt to load rules for system some calls (like open, creat,
> rename, link, etc) with auditctl, and I'm not sure how critical these
> errors are.  This is my first encounter with linux auditing, and I'll
> apologize in advance because I'm sure this is something easy, but I could
> not find a way to search the mailing list archives.
> 
> These are some of my errors from auditctl's output:
> > Syscall name unknown: creat
> > There was an error in line 14 of /etc/audit/audit.rules
> > Syscall name unknown: link
> > There was an error in line 15 of /etc/audit/audit.rules
> > Syscall name unknown: open
> > There was an error in line 16 of /etc/audit/audit.rules
> > Syscall name unknown: open
> > There was an error in line 17 of /etc/audit/audit.rules
> > Syscall name unknown: rename
> > There was an error in line 19 of /etc/audit/audit.rules
> > Syscall name unknown: rename
> > There was an error in line 20 of /etc/audit/audit.rules
> 
> Those lines are below in an excerpt from my rules file (with line numbers
> prepended for easy reading):
>  13 -w /etc/hostname -p wa -k system-locale
>  14 -a always,exit -F arch=b64 -S
> creat,link,mknod,mkdir,symlink,mknodat,linkat,symlinkat -F exit=-EACCES -F
> key=creation
>  15 -a always,exit -F arch=b64 -S link,mkdir,symlink,mkdirat -F exit=-EPERM
> -F key=creation
>  16 -a always,exit -F arch=b64 -S open,openat,open_by_handle_at -F
> exit=-EACCES -F key=open
>  17 -a always,exit -F arch=b64 -S open,openat,open_by_handle_at -F
> exit=-EPERM -F key=open
>  18 -a always,exit -F arch=b64 -S close -F exit=-EIO -F key=close
>  19 -a always,exit -F arch=b64 -S rename -S renameat -S truncate -S chmod
> -S setxattr -S lsetxattr -S removexattr -S lremovexattr -F exit=-EACCES -F
> key=mods
>  20 -a always,exit -F arch=b64 -S rename -S renameat -S truncate -S chmod
> -S setxattr -S lsetxattr -S removexattr -S lremovexattr -F exit=-EPERM -F
> key=mods
> 
> The startup script and rules I'm repurposing had rules for open, create,
> link, unlink, rename, and others, and it seems like those would be part of
> a reasonable auditing security plan, but these system calls do not appear
> to be auditable on my system.

If I were to venture a guess, I'd say that the ABI was created after glibc 
started using openat, renameat, linkat, etc. So, there was never a need to 
implement the older "insecure" syscalls.


> My target platform is a 64 bit arm architecture.   I have a bitbake recipe
> which uses  the --with-aarch64.
> I build the kernel with auditing support (CONFIG_AUDIT and others like it),
> and I pass the audit=1 argument on the kernel boot command line.
> 
> Are there other incantations I am missing?  Any help would be greatly
> appreciated.

You can always strace a program to see what syscalls its using. Also, 
ausyscall is handy for telling you if a syscall exists. I think you can drop 
the missing syscalls from your rules and you'll be fine.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

