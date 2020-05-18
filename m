Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 154F21D8AFC
	for <lists+linux-audit@lfdr.de>; Tue, 19 May 2020 00:32:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589841138;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Oao+Qieyo1e2b/nmWAlGVVjtr4CrP7/+HEmq/njSgSo=;
	b=fKAXt6aH5Dua0GN2cVcqprO+2dsFFDGZvgyJPQLAYg9myAy41C+E3V8OpeZ9gNlqJbGSSg
	kasLR+1uGp3Mh6W3GYZLLILj/nj1yQJX3ANSHB7f5hexnLOapzhNHRHlyMdvcK/NH3sRWF
	T7i+/W1QiBi2rRKXu+Z55Gu0QimeN1A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-j270_Un2MaKuB1shA6DHYA-1; Mon, 18 May 2020 18:32:09 -0400
X-MC-Unique: j270_Un2MaKuB1shA6DHYA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96F068014C0;
	Mon, 18 May 2020 22:32:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 472C882A19;
	Mon, 18 May 2020 22:32:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DCC551809543;
	Mon, 18 May 2020 22:32:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04IH2hWn032304 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 18 May 2020 13:02:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B0D6C200AFEA; Mon, 18 May 2020 17:02:43 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D0412014DF4
	for <linux-audit@redhat.com>; Mon, 18 May 2020 17:02:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 418F58007D0
	for <linux-audit@redhat.com>; Mon, 18 May 2020 17:02:38 +0000 (UTC)
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-480-pDs9bKJPP1ukgRVTJnbOpA-1; Mon, 18 May 2020 13:02:35 -0400
X-MC-Unique: pDs9bKJPP1ukgRVTJnbOpA-1
Received: by mail-oi1-f194.google.com with SMTP id i22so9592571oik.10
	for <linux-audit@redhat.com>; Mon, 18 May 2020 10:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9exVgl+yKCZr1tkPCgpnPxs0p9K6C95pMaN9BrP8zH8=;
	b=G/imIqbN8nCSZ+6NLujPHy1APpAMn5Csf7tlOc6Fust3G5Ks0Ngziy1ApqbIei6Z10
	uCTi6rRE3zxpvnATGD6xLRQC7TTs/4f6RYXHymXkKSIZKARVrQleSRqA82x2f8l/QYqa
	8SUsjvWXqy4iy/d/5cYSUGMJ36OmNnUkFpDRcBYCNan/NqVK33a9k89O7G1xi7xWiP6X
	hz5HrAzTSdjnHhKISb/QtoHWuOdSKISKFcOiD7i8mM6Z3him+Va8eSaTfP7eI2gEjNoi
	18J6lcuSV/wRQVD4sy+gJMMeqQUh4JbiIoG288PAXOQ/hZEPpHTbpBrIIOsXLUMl+MLQ
	zgzQ==
X-Gm-Message-State: AOAM532Td7JNZFyXFS20uhw4OVO3F41tDtEcScUqrSIOJNn8cGS9k5SU
	EgGmpOyaYBYilk4gkGKThgngblrpaM1QgVdJgW4=
X-Google-Smtp-Source: ABdhPJwfjTtgqyziB52cLco6fOXcRdE8uujfq2i2bN5yyuccJjmBue8kz3CSue987iYNnfKfdoVQsTaIMPrkzfidln0=
X-Received: by 2002:aca:a948:: with SMTP id s69mr256645oie.140.1589821354147; 
	Mon, 18 May 2020 10:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200514221142.11857-1-casey@schaufler-ca.com>
	<20200514221142.11857-6-casey@schaufler-ca.com>
In-Reply-To: <20200514221142.11857-6-casey@schaufler-ca.com>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Mon, 18 May 2020 13:02:23 -0400
Message-ID: <CAEjxPJ4TExFpm0KJSodLSEG0J+YNYBE4KdKyd=1g-Qs-qgPHpA@mail.gmail.com>
Subject: Re: [PATCH v17 05/23] net: Prepare UDS for security module stacking
To: Casey Schaufler <casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 18 May 2020 18:31:55 -0400
Cc: John Johansen <john.johansen@canonical.com>,
	SElinux list <selinux@vger.kernel.org>, netdev@vger.kernel.org,
	James Morris <jmorris@namei.org>,
	LSM List <linux-security-module@vger.kernel.org>,
	linux-audit@redhat.com, casey.schaufler@intel.com,
	Stephen Smalley <sds@tycho.nsa.gov>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 14, 2020 at 7:25 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> Change the data used in UDS SO_PEERSEC processing from a
> secid to a more general struct lsmblob. Update the
> security_socket_getpeersec_dgram() interface to use the
> lsmblob. There is a small amount of scaffolding code
> that will come out when the security_secid_to_secctx()
> code is brought in line with the lsmblob.
>
> The secid field of the unix_skb_parms structure has been
> replaced with a pointer to an lsmblob structure, and the
> lsmblob is allocated as needed. This is similar to how the
> list of passed files is managed. While an lsmblob structure
> will fit in the available space today, there is no guarantee
> that the addition of other data to the unix_skb_parms or
> support for additional security modules wouldn't exceed what
> is available.

I preferred the previous approach (in v15 and earlier) but I see that
this was suggested by Paul.  Lifecycle management of lsmdata seems
rather tenuous. I guess the real question is what does netdev prefer.
Regardless, you need to check for memory allocation failure below if
this approach stands.

> Reviewed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> cc: netdev@vger.kernel.org
> ---

> diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
> index 3385a7a0b231..a5c1a029095d 100644
> --- a/net/unix/af_unix.c
> +++ b/net/unix/af_unix.c
> @@ -138,17 +138,18 @@ static struct hlist_head *unix_sockets_unbound(void *addr)
>  #ifdef CONFIG_SECURITY_NETWORK
>  static void unix_get_secdata(struct scm_cookie *scm, struct sk_buff *skb)
>  {
> -       UNIXCB(skb).secid = scm->secid;
> +       UNIXCB(skb).lsmdata = kmemdup(&scm->lsmblob, sizeof(scm->lsmblob),
> +                                     GFP_KERNEL);
>  }

Somewhere you need to check for and handle kmemdup() failure here.

>
>  static inline void unix_set_secdata(struct scm_cookie *scm, struct sk_buff *skb)
>  {
> -       scm->secid = UNIXCB(skb).secid;
> +       scm->lsmblob = *(UNIXCB(skb).lsmdata);
>  }

Lest we have a bad day here.

>
>  static inline bool unix_secdata_eq(struct scm_cookie *scm, struct sk_buff *skb)
>  {
> -       return (scm->secid == UNIXCB(skb).secid);
> +       return lsmblob_equal(&scm->lsmblob, UNIXCB(skb).lsmdata);
>  }

Or here.

> diff --git a/net/unix/scm.c b/net/unix/scm.c
> index 8c40f2b32392..3094323935a4 100644
> --- a/net/unix/scm.c
> +++ b/net/unix/scm.c
> @@ -142,6 +142,12 @@ void unix_destruct_scm(struct sk_buff *skb)
>         scm.pid  = UNIXCB(skb).pid;
>         if (UNIXCB(skb).fp)
>                 unix_detach_fds(&scm, skb);
> +#ifdef CONFIG_SECURITY_NETWORK
> +       if (UNIXCB(skb).lsmdata) {
> +               kfree(UNIXCB(skb).lsmdata);
> +               UNIXCB(skb).lsmdata = NULL;
> +       }
> +#endif

Does this suffice to ensure that lsmdata is always freed?  Seems
weakly connected to the allocation.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

