Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 13EF922478E
	for <lists+linux-audit@lfdr.de>; Sat, 18 Jul 2020 02:44:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595033098;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hz+EsF8WWjWNJBKDAH26QZgkVE5rnak/0VgFdj+aGOU=;
	b=FXh4HrgFgpaHshMpE7FECLc6+cuhKzdTWQXxgB99dGHeYPT8bEGX2gy0t6UlxAdonex0Cy
	t9ng7dyM1dNdsinY8YTtzdmiizgHehTZLTg3OIsg+/+rnQ6mVGrKdfvkpJSPsuUyNncmP4
	++RXP1vbG36PcefLi/x5lzi5+CAr3hU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-hJGnX_-hPZypdP2zgJ9dGA-1; Fri, 17 Jul 2020 20:44:56 -0400
X-MC-Unique: hJGnX_-hPZypdP2zgJ9dGA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FC8B107ACCA;
	Sat, 18 Jul 2020 00:44:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E7267B42B;
	Sat, 18 Jul 2020 00:44:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C56B094EE5;
	Sat, 18 Jul 2020 00:44:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06I0hukQ011793 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 17 Jul 2020 20:43:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BC3687BD70; Sat, 18 Jul 2020 00:43:56 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.3])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD2427B42B;
	Sat, 18 Jul 2020 00:43:44 +0000 (UTC)
Date: Fri, 17 Jul 2020 20:43:41 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 V9 08/13] audit: add containerid support for user
	records
Message-ID: <20200718004341.ruyre5xhlu3ps2tr@madcap2.tricolour.ca>
References: <cover.1593198710.git.rgb@redhat.com>
	<4a5019ed3cfab416aeb6549b791ac6d8cc9fb8b7.1593198710.git.rgb@redhat.com>
	<CAHC9VhSwMEZrq0dnaXmPi=bu0NgUtWPuw-2UGDrQa6TwxWkZtw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhSwMEZrq0dnaXmPi=bu0NgUtWPuw-2UGDrQa6TwxWkZtw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-07-05 11:11, Paul Moore wrote:
> On Sat, Jun 27, 2020 at 9:23 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> >
> > Add audit container identifier auxiliary record to user event standalone
> > records.
> >
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > Acked-by: Neil Horman <nhorman@tuxdriver.com>
> > Reviewed-by: Ondrej Mosnacek <omosnace@redhat.com>
> > ---
> >  kernel/audit.c | 19 ++++++++++++-------
> >  1 file changed, 12 insertions(+), 7 deletions(-)
> >
> > diff --git a/kernel/audit.c b/kernel/audit.c
> > index 54dd2cb69402..997c34178ee8 100644
> > --- a/kernel/audit.c
> > +++ b/kernel/audit.c
> > @@ -1507,6 +1504,14 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
> >                                 audit_log_n_untrustedstring(ab, str, data_len);
> >                         }
> >                         audit_log_end(ab);
> > +                       rcu_read_lock();
> > +                       cont = _audit_contobj_get(current);
> > +                       rcu_read_unlock();
> > +                       audit_log_container_id(context, cont);
> > +                       rcu_read_lock();
> > +                       _audit_contobj_put(cont);
> > +                       rcu_read_unlock();
> > +                       audit_free_context(context);
> 
> I haven't searched the entire patchset, but it seems like the pattern
> above happens a couple of times in this patchset, yes?  If so would it
> make sense to wrap the above get/log/put in a helper function?

I've redone the locking with an rcu lock around the get and a spinlock
around the put.  It occurs to me that putting an rcu lock around the
whole thing and doing a get without the refcount increment would save
us the spinlock and put and be fine since we'd be fine with stale but
consistent information traversing the contobj list from this point to
report it.  Problem with that is needing to use GFP_ATOMIC due to the
rcu lock.  If I stick with the spinlock around the put then I can use
GFP_KERNEL and just grab the spinlock while traversing the contobj list.

> Not a big deal either way, I'm pretty neutral on it at this point in
> the patchset but thought it might be worth mentioning in case you
> noticed the same and were on the fence.

There is only one other place this is used, in audit_log_exit in
auditsc.c.  I had noted the pattern but wasn't sure it was worth it.
Inline or not?  Should we just let the compiler decide?

> paul moore

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
https://www.redhat.com/mailman/listinfo/linux-audit

