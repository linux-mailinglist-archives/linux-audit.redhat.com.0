Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D886135CF
	for <lists+linux-audit@lfdr.de>; Mon, 31 Oct 2022 13:19:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667218788;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=azcuEOMw+1/C6vCnvFpNyG+6HiIwbBScGYkUfm23Nvs=;
	b=WMqB3BRdO7+Of+bhSdjcIuuDOZF8Ud3yIBp4GWLce25qE+MaekPyFJWYxXDdWPTc5a8veY
	nPasFOAmlOsYGmzS8KnGhTch8tjoxydQx265fy3GXbXIc3x4AdZjI8MclPfDk3XTjNaCSS
	MW8o+y2n+nnAs5gW/b4pMYJdX/waztg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-J8x035GVO02RHClwC-G1yg-1; Mon, 31 Oct 2022 08:19:45 -0400
X-MC-Unique: J8x035GVO02RHClwC-G1yg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C84A93C0F44D;
	Mon, 31 Oct 2022 12:19:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C998D53AA;
	Mon, 31 Oct 2022 12:19:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3D55D19465B1;
	Mon, 31 Oct 2022 12:19:41 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A9DBF194658C for <linux-audit@listman.corp.redhat.com>;
 Mon, 31 Oct 2022 12:19:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8C048401D46; Mon, 31 Oct 2022 12:19:40 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-0-8.rdu2.redhat.com [10.22.0.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E051F49BB61;
 Mon, 31 Oct 2022 12:19:38 +0000 (UTC)
Date: Mon, 31 Oct 2022 08:19:36 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH] audit: fix undefined behavior in bit shift for AUDIT_BIT
Message-ID: <Y1+9WMNR1PuCgu6g@madcap2.tricolour.ca>
References: <20221031021021.3888564-1-cuigaosheng1@huawei.com>
 <CAHC9VhQ2q0rA_OtL9VZm=dMLwMKu2cME3bC2LEzTBa3A-XsQbg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhQ2q0rA_OtL9VZm=dMLwMKu2cME3bC2LEzTBa3A-XsQbg@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
Cc: arnd@arndb.de, paulmck@kernel.org, eparis@redhat.com, dhowells@redhat.com,
 linux-audit@redhat.com, mtk.manpages@gmail.com, tglx@linutronix.de,
 Gaosheng Cui <cuigaosheng1@huawei.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2022-10-31 07:34, Paul Moore wrote:
> On Sun, Oct 30, 2022 at 10:10 PM Gaosheng Cui <cuigaosheng1@huawei.com> wrote:
> >
> > Shifting signed 32-bit value by 31 bits is undefined, so changing
> > significant bit to unsigned. The UBSAN warning calltrace like below:
> >
> > UBSAN: shift-out-of-bounds in kernel/auditfilter.c:179:23
> > left shift of 1 by 31 places cannot be represented in type 'int'
> > Call Trace:
> >  <TASK>
> >  dump_stack_lvl+0x7d/0xa5
> >  dump_stack+0x15/0x1b
> >  ubsan_epilogue+0xe/0x4e
> >  __ubsan_handle_shift_out_of_bounds+0x1e7/0x20c
> >  audit_register_class+0x9d/0x137
> >  audit_classes_init+0x4d/0xb8
> >  do_one_initcall+0x76/0x430
> >  kernel_init_freeable+0x3b3/0x422
> >  kernel_init+0x24/0x1e0
> >  ret_from_fork+0x1f/0x30
> >  </TASK>
> >
> > Fixes: 607ca46e97a1 ("UAPI: (Scripted) Disintegrate include/linux")
> 
> Thanks, this patch looks good, although the 'Fixes:' line above isn't
> correct.  The commit you reference may be the commit which created
> AUDIT_BIT in include/uapi/linux/audit.h, but before that it was
> defined in include/linux/audit.h with the original implementation
> shipping in v2.6.6-rc1.  As the original AUDIT_BIT implementation
> predates git itself, I would suggest removing the 'Fixes' line
> entirely and I'll simply add the usual stable marking when I merge it
> into audit/stable-6.1.  If that is okay with you I'll go ahead and
> merge this patch which that tweak - is that okay?

In fact, it is the original kernel audit subsystem commit if you join
the 3 trees that went in to Linux 2.6.6-rc1:

commit b7b0074ca3c9fe22d07b97e42a99c8b27be6307f
Author:     Andrew Morton <akpm@osdl.org>
AuthorDate: 2004-04-11 23:29:12 -0700
Commit:     Linus Torvalds <torvalds@ppc970.osdl.org>
CommitDate: 2004-04-11 23:29:12 -0700

    [PATCH] Light-weight Auditing Framework
    
    From: Rik Faith <faith@redhat.com>

> > Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> > ---
> >  include/uapi/linux/audit.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
> > index 7c1dc818b1d5..d676ed2b246e 100644
> > --- a/include/uapi/linux/audit.h
> > +++ b/include/uapi/linux/audit.h
> > @@ -187,7 +187,7 @@
> >  #define AUDIT_MAX_KEY_LEN  256
> >  #define AUDIT_BITMASK_SIZE 64
> >  #define AUDIT_WORD(nr) ((__u32)((nr)/32))
> > -#define AUDIT_BIT(nr)  (1 << ((nr) - AUDIT_WORD(nr)*32))
> > +#define AUDIT_BIT(nr)  (1U << ((nr) - AUDIT_WORD(nr)*32))
> >
> >  #define AUDIT_SYSCALL_CLASSES 16
> >  #define AUDIT_CLASS_DIR_WRITE 0
> > --
> > 2.25.1
> 
> --
> paul-moore.com
> 
> --
> Linux-audit mailing list
> Linux-audit@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-audit
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
https://listman.redhat.com/mailman/listinfo/linux-audit

