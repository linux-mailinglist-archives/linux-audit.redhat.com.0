Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1C58B24DFBE
	for <lists+linux-audit@lfdr.de>; Fri, 21 Aug 2020 20:35:56 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-4SyuSSKdNt2XQLviQG6nRA-1; Fri, 21 Aug 2020 14:35:52 -0400
X-MC-Unique: 4SyuSSKdNt2XQLviQG6nRA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A1551084C8F;
	Fri, 21 Aug 2020 18:35:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C584C10190AA;
	Fri, 21 Aug 2020 18:35:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6396E662BD;
	Fri, 21 Aug 2020 18:35:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LIZFA4005029 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 14:35:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CB661100BC9C; Fri, 21 Aug 2020 18:35:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C574D100BFF1
	for <linux-audit@redhat.com>; Fri, 21 Aug 2020 18:35:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2482E18AE96E
	for <linux-audit@redhat.com>; Fri, 21 Aug 2020 18:35:13 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
	[209.85.218.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-534-wAbFsCXLNmq003aVY4YUXA-1; Fri, 21 Aug 2020 14:35:10 -0400
X-MC-Unique: wAbFsCXLNmq003aVY4YUXA-1
Received: by mail-ej1-f66.google.com with SMTP id bo3so3417173ejb.11
	for <linux-audit@redhat.com>; Fri, 21 Aug 2020 11:35:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=q4frqIW9I+72sr79+gm0FlxLWfHVNqfXNa3Q85/YG38=;
	b=d4Vdvtb5ynfLY46bx9pxwGaoNERUKBxF3vJnL1CmuxPKFhvQzJSdo3IgOAWMl504ww
	UflXjWfjCrIkoYeMAE5TKghhIsic6mmTwO/fD0ZZhh6ke2yimF8MEgnZoV6cSK8UVj7R
	FeK9Kjl2DeOWgIYgBH4arx7+NFr4/pI3G3QPQvDu64d9DsWelNIXwaiH40RMzvbO7H3z
	TwNHI0IXEtVYl2keWuEJb8Ura+HnIv1FJLWmhPdA9+MuZUAxf4AD3RkJFv2XsDVa+EiW
	ABcdNUNoFuOeui1piIPSC0pmmcWX86eN7h3ae+q/ZOhdc8luOVt1oTvLsPKe1zVdKs1W
	GoKQ==
X-Gm-Message-State: AOAM531J2urVSE6kcqEnFkMWA5jGhU3WG6VHjeiFs+b04td8gH27/B92
	7pCgkQ+/5kGGfkbWcphpx7MGzM9gphBilR27X74r
X-Google-Smtp-Source: ABdhPJxfrGP14Je3zh0ICJTpECzCcS4IA89+zoHjdAPERXK51mLX3W5gqb4xv4Taij+96NOlohguUZetQbWOQvF7dOs=
X-Received: by 2002:a17:906:43c9:: with SMTP id
	j9mr4143785ejn.542.1598034909369; 
	Fri, 21 Aug 2020 11:35:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593198710.git.rgb@redhat.com>
	<4a5019ed3cfab416aeb6549b791ac6d8cc9fb8b7.1593198710.git.rgb@redhat.com>
	<CAHC9VhSwMEZrq0dnaXmPi=bu0NgUtWPuw-2UGDrQa6TwxWkZtw@mail.gmail.com>
	<20200718004341.ruyre5xhlu3ps2tr@madcap2.tricolour.ca>
In-Reply-To: <20200718004341.ruyre5xhlu3ps2tr@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 21 Aug 2020 14:34:57 -0400
Message-ID: <CAHC9VhSDLF3W4LNqdgz-56m8wXLZLpDhMd8S-DxFcrKvsgCreg@mail.gmail.com>
Subject: Re: [PATCH ghak90 V9 08/13] audit: add containerid support for user
	records
To: Richard Guy Briggs <rgb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, mpatel@redhat.com,
	Serge Hallyn <serge@hallyn.com>
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 17, 2020 at 8:44 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-07-05 11:11, Paul Moore wrote:
> > On Sat, Jun 27, 2020 at 9:23 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> > >
> > > Add audit container identifier auxiliary record to user event standalone
> > > records.
> > >
> > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > Acked-by: Neil Horman <nhorman@tuxdriver.com>
> > > Reviewed-by: Ondrej Mosnacek <omosnace@redhat.com>
> > > ---
> > >  kernel/audit.c | 19 ++++++++++++-------
> > >  1 file changed, 12 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/kernel/audit.c b/kernel/audit.c
> > > index 54dd2cb69402..997c34178ee8 100644
> > > --- a/kernel/audit.c
> > > +++ b/kernel/audit.c
> > > @@ -1507,6 +1504,14 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
> > >                                 audit_log_n_untrustedstring(ab, str, data_len);
> > >                         }
> > >                         audit_log_end(ab);
> > > +                       rcu_read_lock();
> > > +                       cont = _audit_contobj_get(current);
> > > +                       rcu_read_unlock();
> > > +                       audit_log_container_id(context, cont);
> > > +                       rcu_read_lock();
> > > +                       _audit_contobj_put(cont);
> > > +                       rcu_read_unlock();
> > > +                       audit_free_context(context);
> >
> > I haven't searched the entire patchset, but it seems like the pattern
> > above happens a couple of times in this patchset, yes?  If so would it
> > make sense to wrap the above get/log/put in a helper function?
>
> I've redone the locking with an rcu lock around the get and a spinlock
> around the put.  It occurs to me that putting an rcu lock around the
> whole thing and doing a get without the refcount increment would save
> us the spinlock and put and be fine since we'd be fine with stale but
> consistent information traversing the contobj list from this point to
> report it.  Problem with that is needing to use GFP_ATOMIC due to the
> rcu lock.  If I stick with the spinlock around the put then I can use
> GFP_KERNEL and just grab the spinlock while traversing the contobj list.
>
> > Not a big deal either way, I'm pretty neutral on it at this point in
> > the patchset but thought it might be worth mentioning in case you
> > noticed the same and were on the fence.
>
> There is only one other place this is used, in audit_log_exit in
> auditsc.c.  I had noted the pattern but wasn't sure it was worth it.
> Inline or not?  Should we just let the compiler decide?

I'm generally not a fan of explicit inlines unless it has been shown
to be a real problem.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

