Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 07F922193CA
	for <lists+linux-audit@lfdr.de>; Thu,  9 Jul 2020 00:49:44 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-hjWq3oxyOT6lShSokRii1A-1; Wed, 08 Jul 2020 18:49:42 -0400
X-MC-Unique: hjWq3oxyOT6lShSokRii1A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B13C38015F3;
	Wed,  8 Jul 2020 22:49:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B25C60E1C;
	Wed,  8 Jul 2020 22:49:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 124BF1809547;
	Wed,  8 Jul 2020 22:49:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 068MnXhN018138 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 8 Jul 2020 18:49:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6B2CD33256; Wed,  8 Jul 2020 22:49:33 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 664FD33258
	for <linux-audit@redhat.com>; Wed,  8 Jul 2020 22:49:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58681100CF84
	for <linux-audit@redhat.com>; Wed,  8 Jul 2020 22:49:31 +0000 (UTC)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
	[209.85.218.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-116-c5NRK6iwMv2VTDd9TkhBsA-1; Wed, 08 Jul 2020 18:49:29 -0400
X-MC-Unique: c5NRK6iwMv2VTDd9TkhBsA-1
Received: by mail-ej1-f67.google.com with SMTP id a1so153434ejg.12
	for <linux-audit@redhat.com>; Wed, 08 Jul 2020 15:49:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=i/JhqI551zzsFdlMcIawAStmPkV0Ai7g5UwLN0TaHRw=;
	b=M/5lr3DagPxEeTMFEPJf+AidRf3Y8BtUkbBQ70xN9TWfALblFZj2POMGC/WYYFnLoh
	/mj5o9c2GP+/8fjQsVPJCBnsOFjB8LWVfvPZZhyG2gV4HEfSViuZMXFi8GCqLAsstgwW
	RaDBcjTjtvfPWNryVwMaWLOXVLHmIi7aTbCJ9ok2mKUcMOo/xveh8ij89RKPFPPutYTF
	mCeE9mCDoRmr9NYy2RSSd3SQhkc2YW11iokbrHX8DcHuodBj2x8T1k00M+TRlLsRsItq
	Je7pmwvKpQQpYh2RKjvy2V5dhN55XBcbzBZANhwTlJEL3+ncOqlpWc1mD6S0ywirEEjj
	UOpA==
X-Gm-Message-State: AOAM533o57edPFIU66IYqG82qysDMHwN1oFu1FLMAAlHvLNoj/z7GL12
	1tyKTFT2Jsmob2fuQALOLmT6WzpTDWRkA0dDkCi1
X-Google-Smtp-Source: ABdhPJyc2RSLaZlhIz1JbaOznefW/wX7sZV90VfyZxxI9cmBgFbXrxGtIf633mc7rVofFP17t7VzfWTNBuhNJI6sfBE=
X-Received: by 2002:a17:906:c1d8:: with SMTP id
	bw24mr43782631ejb.91.1594248567849; 
	Wed, 08 Jul 2020 15:49:27 -0700 (PDT)
MIME-Version: 1.0
References: <b62d4388b488dedfa2758f32e6d1e5414179b4f2.1593796497.git.rgb@redhat.com>
In-Reply-To: <b62d4388b488dedfa2758f32e6d1e5414179b4f2.1593796497.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 8 Jul 2020 18:49:16 -0400
Message-ID: <CAHC9VhReURKRe63t7mudKpkW0aVNpCmF=UWHSof1uvRkmZ8HTQ@mail.gmail.com>
Subject: Re: [PATCH ghak122 v1] audit: store event sockaddr in case of no rules
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: Eric Paris <eparis@parisplace.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 3, 2020 at 1:18 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> When there are no rules present, the event SOCKADDR record is not
> generated due to audit_dummy_context() generated at syscall entry from
> audit_n_rules.  Store this information if there is a context present to
> store it so that mandatory events are more complete (startup, LSMs...).
>
> Please see the upstream issue
> https://github.com/linux-audit/audit-kernel/issues/122
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
> Passes audit-testsuite.
>
>  include/linux/audit.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Do we have any certification requirements driving this change?  I ask
because if we make this change, why not do the same for PATH records?
The problem of course is that doing this for both is going to be
costly, the PATH records in particular seem like they would raise a
performance regression.

I agree it would be nice to have this information, but I fear that
gating this on audit_dummy_context() is the right thing to do unless
there is a strong requirement that we always record this information.

> diff --git a/include/linux/audit.h b/include/linux/audit.h
> index 03c4035a532b..07fecd99741a 100644
> --- a/include/linux/audit.h
> +++ b/include/linux/audit.h
> @@ -448,7 +448,7 @@ static inline int audit_socketcall_compat(int nargs, u32 *args)
>
>  static inline int audit_sockaddr(int len, void *addr)
>  {
> -       if (unlikely(!audit_dummy_context()))
> +       if (audit_context())
>                 return __audit_sockaddr(len, addr);
>         return 0;
>  }
> --
> 1.8.3.1

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

