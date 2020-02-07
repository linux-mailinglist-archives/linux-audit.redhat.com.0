Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 59BC7155E8E
	for <lists+linux-audit@lfdr.de>; Fri,  7 Feb 2020 20:18:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581103117;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XSBh2dSmBlA4WWSAKC9BrBp8qYUpAeA+omlqft2q3uo=;
	b=NAllK+EQggkXrCYZrx/DkgIN1r0vrzwzaGk7UM6fjGyAk4fVvEmWbfwlfIZKiqw+jq/0Ls
	BvFT6J6zsgKq2H5Q7Hbpgf2K5LtdkKFSB6Zcf7tfRpv/STzv/YGhQY7629JxF4MsMzlWwH
	hL/JrKxs+9QcK7QakTna15FtPucEqmw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-fq8bZCGlM4u1bfhw_VJioA-1; Fri, 07 Feb 2020 14:18:33 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9AC914EB;
	Fri,  7 Feb 2020 19:18:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED1C2863A5;
	Fri,  7 Feb 2020 19:18:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 16DDA1803C33;
	Fri,  7 Feb 2020 19:18:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 017JHKWh015933 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 7 Feb 2020 14:17:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EA3B960BF7; Fri,  7 Feb 2020 19:17:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-155.phx2.redhat.com [10.3.116.155])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 989AE60BEC;
	Fri,  7 Feb 2020 19:17:18 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: Is auditing ftruncate useful?
Date: Fri, 07 Feb 2020 14:17:17 -0500
Message-ID: <1758232.KkKbY19U6n@x2>
Organization: Red Hat
In-Reply-To: <57c2b1a1-5406-4d77-9dc5-ad6c99b987a8@magitekltd.com>
References: <5599a207-7054-af2e-6d10-0421154168b8@nwra.com>
	<8010cdd2-468b-ac87-54f1-2846baf28d28@nwra.com>
	<57c2b1a1-5406-4d77-9dc5-ad6c99b987a8@magitekltd.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: fq8bZCGlM4u1bfhw_VJioA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thursday, February 6, 2020 1:33:19 PM EST Lenny Bruzenak wrote:
> > Doesn't seem much better:
> > 
> > type=PROCTITLE msg=audit(02/06/2020 10:58:23.626:119631) :
> > proctitle=/bin/bash /usr/bin/thunderbird
> > type=SYSCALL msg=audit(02/06/2020 10:58:23.626:119631) : arch=x86_64
> > syscall=ftruncate success=yes exit=0 a0=0x4a a1=0x28 a2=0x7f1e41600018
> > a3=0xfffffe00 items=0 ppid=2451 pid=3561 auid=USER uid=USER gid=USER
> > euid=USER suid=USER fsuid=USER egid=USER sgid=USER fsgid=USER tty=(none)
> > ses=1 comm=thunderbird exe=/usr/lib64/thunderbird/thunderbird
> > subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
> > key=watched_users
> > Why no PATH entry?  I have them for things like open:
>
> The kernel guys can probably answer this accurately.

I would have thought that they would have chimed in by now. Since they didn't 
you might want to file an issue on github. I think you found a problem that 
someone should look into some day.

https://github.com/linux-audit/audit-kernel/issues

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

