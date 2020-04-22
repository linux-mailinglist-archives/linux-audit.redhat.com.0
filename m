Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 60B0E1B4DE7
	for <lists+linux-audit@lfdr.de>; Wed, 22 Apr 2020 22:02:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587585759;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yy2sr9JJp5dUKdhUPvb85vMYagMmeXzqeer6bKiDFa0=;
	b=ioeNBR6CW2lSonLkn70fwyEDarKqIjKZfkcT3VlOrbYfcmg/tDSuIR+ud/gLqSHcpmpkYz
	FfVynO3QZXhDSi7Y3qQ5JjSznVqMiRizxM5tuh/mFpi0LTdeSF79ve3OAm2P2ey3XRvE2B
	UJqEpnlOP0Vhd1B6mmypx1Tr46KyMNw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-cVwy7WgJPgCQ_NdhIo_voA-1; Wed, 22 Apr 2020 16:02:37 -0400
X-MC-Unique: cVwy7WgJPgCQ_NdhIo_voA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1D698017FD;
	Wed, 22 Apr 2020 20:02:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01CFB5D70A;
	Wed, 22 Apr 2020 20:02:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E61A21809541;
	Wed, 22 Apr 2020 20:02:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03MK2IpQ004334 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 22 Apr 2020 16:02:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E9D362024517; Wed, 22 Apr 2020 20:02:17 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E58E72093CE0
	for <linux-audit@redhat.com>; Wed, 22 Apr 2020 20:02:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D043802065
	for <linux-audit@redhat.com>; Wed, 22 Apr 2020 20:02:15 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
	[209.85.218.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-387-Kx-UpNc1Nh-smTYppmMuIg-1; Wed, 22 Apr 2020 16:02:12 -0400
X-MC-Unique: Kx-UpNc1Nh-smTYppmMuIg-1
Received: by mail-ej1-f66.google.com with SMTP id q8so2856107eja.2
	for <linux-audit@redhat.com>; Wed, 22 Apr 2020 13:02:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wdsorbwm4QELvu9Kdtsytf+1mIreXsqW4drp9A90jg0=;
	b=IqBIOlAK7HIJbePa3mwFw9eBeO+2MTfSMja69UydlNJAdrFJtNiTXspS/NtypecfAX
	ei5UF1sHQZUTe7NVumWwI2AzfEs2OZi8iwsx/5FQwXt8FJ/ZNAwVvmr8VOLfq89XoOxh
	zSiRKmKFcBWbLo40EW/m1a5rSV0s1mfnunYax/2y6JZYagJaCLhUbZjmmxnlEo0TWE9U
	iIrycbP6NvaxHgdXcQJ3WchgqkXZO7czqIA1UeDSbam9RcA8TZc9t7R3e6NKMQS0t99L
	L/i8aCY+ZkAkH31zT5uZ8Cu+oRSQ5Q8fuCc0Vuaa2G/pQghoSThYiJLSk0yZSwDGtq0K
	RNvw==
X-Gm-Message-State: AGi0PuYZPBdijlJCWR8WmNbEui4IUf3VAz2nn9fu+mw6+02Oos3Iu6H6
	IkMM+35NgzJcluMJgOp7tSZWGgouzyMRUAJR8RaN4Pk=
X-Google-Smtp-Source: APiQypIFOD5mIB1sD2C7Kagk0jOIQ5FaoE4DXbUcGAYI0FJ1m8K9oYHmcXO+VSCRHvrXyTPw4vdClUaLjNF8g4Cem3g=
X-Received: by 2002:a17:906:35d0:: with SMTP id p16mr34555ejb.77.1587585730350;
	Wed, 22 Apr 2020 13:02:10 -0700 (PDT)
MIME-Version: 1.0
References: <1587536907-63272-1-git-send-email-guyiwen@huawei.com>
	<20200422132251.xgg44mg7yeiuwvow@madcap2.tricolour.ca>
In-Reply-To: <20200422132251.xgg44mg7yeiuwvow@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 22 Apr 2020 16:01:59 -0400
Message-ID: <CAHC9VhQQnfrO43vmOABcGc+zEUtPoAJ1ez5Oe2sP85WX5eM0Gw@mail.gmail.com>
Subject: Re: [PATCH] audit: allow audit_reusename to check kernel path
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03MK2IpQ004334
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 22, 2020 at 9:23 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-04-22 14:28, Yiwen Gu wrote:
> > Currently, audit_reusename check file path only by comparing
> > userspace pointer "uptr", without checking the situation where
> > the file name is different with the same uptr.
>
> Has this been found to actually be a problem?  If so, is there a
> reproducer to demonstrate this?
>
> The reason it was originally set up like this was to make the check as
> efficient as possible, comparing only a pointer, rather than needing to
> compare the entire string.

Let's also not forget that we don't actually use the uptr's
dereferenced value for PATH reporting, for obvious reasons (it's owned
and subject to manipulation by userspace).  We use the uptr pointer
value for tracking only, which is okay.

audit_reusename() is a shortcut to get a previously populated filename
struct associated with the filename buffer passed into the kernel by
userspace.  It doesn't matter that the buffer contents may have
changed, we safely copy the buffer contents into the kernel (via the
filename struct) before use, what does matter is that we can associate
the filename struct with the uptr ... which we do in audit_reusename,
audit_getname(), etc.

> > Add kname into audit_reusename function to check file names
> > from the audit_names list.
> >
> > Signed-off-by: Yiwen Gu <guyiwen@huawei.com>
> > ---
> >  fs/namei.c            |  9 +++++----
> >  include/linux/audit.h | 11 +++++++----
> >  kernel/auditsc.c      |  7 ++++---
> >  3 files changed, 16 insertions(+), 11 deletions(-)
> >
> > diff --git a/fs/namei.c b/fs/namei.c
> > index db6565c99825..d5fb4bd12aec 100644
> > --- a/fs/namei.c
> > +++ b/fs/namei.c
> > @@ -128,13 +128,10 @@ struct filename *
> >  getname_flags(const char __user *filename, int flags, int *empty)
> >  {
> >       struct filename *result;
> > +     struct filename *result_audit;
> >       char *kname;
> >       int len;
> >
> > -     result = audit_reusename(filename);
> > -     if (result)
> > -             return result;
> > -
> >       result = __getname();
> >       if (unlikely(!result))
> >               return ERR_PTR(-ENOMEM);
> > @@ -197,6 +194,10 @@ getname_flags(const char __user *filename, int flags, int *empty)
> >               }
> >       }
> >
> > +     result_audit = audit_reusename(filename, kname);
> > +     if (result_audit)
> > +             return result_audit;
> > +
> >       result->uptr = filename;
> >       result->aname = NULL;
> >       audit_getname(result);
> > diff --git a/include/linux/audit.h b/include/linux/audit.h
> > index f9ceae57ca8d..71fb783f14c4 100644
> > --- a/include/linux/audit.h
> > +++ b/include/linux/audit.h
> > @@ -266,7 +266,8 @@ extern void __audit_free(struct task_struct *task);
> >  extern void __audit_syscall_entry(int major, unsigned long a0, unsigned long a1,
> >                                 unsigned long a2, unsigned long a3);
> >  extern void __audit_syscall_exit(int ret_success, long ret_value);
> > -extern struct filename *__audit_reusename(const __user char *uptr);
> > +extern struct filename *__audit_reusename(const __user char *uptr,
> > +                             const char *kname);
> >  extern void __audit_getname(struct filename *name);
> >
> >  extern void __audit_inode(struct filename *name, const struct dentry *dentry,
> > @@ -316,10 +317,11 @@ static inline void audit_syscall_exit(void *pt_regs)
> >               __audit_syscall_exit(success, return_code);
> >       }
> >  }
> > -static inline struct filename *audit_reusename(const __user char *name)
> > +static inline struct filename *audit_reusename(const __user char *name,
> > +                                             const char *kname)
> >  {
> >       if (unlikely(!audit_dummy_context()))
> > -             return __audit_reusename(name);
> > +             return __audit_reusename(name, kname);
> >       return NULL;
> >  }
> >  static inline void audit_getname(struct filename *name)
> > @@ -539,7 +541,8 @@ static inline struct audit_context *audit_context(void)
> >  {
> >       return NULL;
> >  }
> > -static inline struct filename *audit_reusename(const __user char *name)
> > +static inline struct filename *audit_reusename(const __user char *name,
> > +                                             const char *kname)
> >  {
> >       return NULL;
> >  }
> > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > index 4effe01ebbe2..62ffc02abb98 100644
> > --- a/kernel/auditsc.c
> > +++ b/kernel/auditsc.c
> > @@ -1843,13 +1843,14 @@ static struct audit_names *audit_alloc_name(struct audit_context *context,
> >  /**
> >   * __audit_reusename - fill out filename with info from existing entry
> >   * @uptr: userland ptr to pathname
> > + * @kname: kernel pathname string
> >   *
> >   * Search the audit_names list for the current audit context. If there is an
> > - * existing entry with a matching "uptr" then return the filename
> > + * existing entry with matching "uptr" and "kname" then return the filename
> >   * associated with that audit_name. If not, return NULL.
> >   */
> >  struct filename *
> > -__audit_reusename(const __user char *uptr)
> > +__audit_reusename(const __user char *uptr, const char *kname)
> >  {
> >       struct audit_context *context = audit_context();
> >       struct audit_names *n;
> > @@ -1857,7 +1858,7 @@ __audit_reusename(const __user char *uptr)
> >       list_for_each_entry(n, &context->names_list, list) {
> >               if (!n->name)
> >                       continue;
> > -             if (n->name->uptr == uptr) {
> > +             if (n->name->uptr == uptr && !strcmp(kname, n->name->name)) {
> >                       n->name->refcnt++;
> >                       return n->name;
> >               }
> > --
> > 2.17.1
> >
> >
> >
> > --
> > Linux-audit mailing list
> > Linux-audit@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-audit
>
> - RGB
>
> --
> Richard Guy Briggs <rgb@redhat.com>
> Sr. S/W Engineer, Kernel Security, Base Operating Systems
> Remote, Ottawa, Red Hat Canada
> IRC: rgb, SunRaycer
> Voice: +1.647.777.2635, Internal: (81) 32635
>


-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

