Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8691E4F53
	for <lists+linux-audit@lfdr.de>; Wed, 27 May 2020 22:32:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590611519;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZYfU9Gb5YGH5AZpRdmx5h76G2z3G4kwSJLNEmNWOjr4=;
	b=Nuu9QiTO0A7On9sHCq3aGlR7Gd5zHpU0cq+4MdKcunHvSWQ0Qh97ObmxJ7xiWoymOLlW4f
	G2SBenn1IHbRDCnw1aoIOAz8tlSW+T9nQfaGYaIbMAw65ycBJTQ0yQ0a4BcTa3zEJI+RXV
	2Ay+QKJrpvCVSW85tWgZKBwM2S5ZpYQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-Bim3wyLlODicsyrX7fCtFA-1; Wed, 27 May 2020 16:31:44 -0400
X-MC-Unique: Bim3wyLlODicsyrX7fCtFA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79C2D100A8E7;
	Wed, 27 May 2020 20:31:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DBA51A913;
	Wed, 27 May 2020 20:31:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8A52E1809541;
	Wed, 27 May 2020 20:31:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04RK6Amu010122 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 16:06:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 77E862156A22; Wed, 27 May 2020 20:06:10 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7443B2166BA4
	for <linux-audit@redhat.com>; Wed, 27 May 2020 20:06:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8799828840
	for <linux-audit@redhat.com>; Wed, 27 May 2020 20:06:07 +0000 (UTC)
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc
	[193.142.43.52]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-311-9YVfgM0pM_ue8gzjdimt1Q-1; Wed, 27 May 2020 16:06:05 -0400
X-MC-Unique: 9YVfgM0pM_ue8gzjdimt1Q-1
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1je2JN-0002DO-Fg; Wed, 27 May 2020 22:06:01 +0200
Date: Wed, 27 May 2020 22:06:01 +0200
From: Florian Westphal <fw@strlen.de>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH ghak124 v1] audit: log nftables configuration change events
Message-ID: <20200527200601.GJ2915@breakpoint.cc>
References: <d92a718b54269f426acc18f28e561031da66d3ca.1590579994.git.rgb@redhat.com>
	<20200527145317.GI2915@breakpoint.cc>
	<20200527152443.7axktc2im3zpvk37@madcap2.tricolour.ca>
MIME-Version: 1.0
In-Reply-To: <20200527152443.7axktc2im3zpvk37@madcap2.tricolour.ca>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Wed, 27 May 2020 16:31:34 -0400
Cc: Florian Westphal <fw@strlen.de>, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, twoerner@redhat.com,
	eparis@parisplace.org, tgraf@infradead.org
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Richard Guy Briggs <rgb@redhat.com> wrote:
> Well, we are only logging "some change", so is it necessary to log the
> generation count to show that?  Is the generation count of specific
> interest?

No, its of no specific interest.  I just worded this poorly.
If the generation id increments, then something has been changed by the
batch, thats all.

> > (After that, kernel can't back down anymore, i.e. all errors are
> >  caught/handled beforehand).
> 
> I did think of recording all failed attempts too, but coding that would
> be more effort.  It is worth doing if it is deemed important,
> particularly for permission issues (as opposed to resource limits or
> packet format errors.  This would be more of interest to a security
> officer rather than a network technician, but the latter may find it
> useful for debugging.

The permission check is done early, in nfnetlink_rcv() (search for
EPERM), you would need to add an audit call there if thats relevant
for audit purposes.

> > If its 'any config change', then you also need to handle adds
> > or delete from sets/maps, since that may allow something that wasn't
> > allowed before, e.g. consider
> > 
> > ip saddr @trused accept
> > 
> > and then, later on,
> > nft add element ip filter @trusted { 10.0.0.0/8, 192.168.0.1 }
> > 
> > This would not add a table, or chain, or set, but it does implicitly
> > alter the ruleset.
> 
> Ah, ok, so yes, we would need that too.  I see family and table in
> there, op is evident.  Is there a useful value we can use in the
> "entries" field?

Maybe the handle of the set that the element was added to.
Each set, rule, chain, ... has a kernel-assigned number that
serves as a unique identifier.

> > Is that record format expected to emit the current number of chains?
> 
> I was aiming for a relevant value such as perhaps the new rule number or
> the rule number being deleted.

In that case, use the handle, which is a u64 with a unique value (for a
given table).

> > Since table names can be anything in nf_tables (they have no special
> > properties anymore), the table name is interesting from a informational
> > pov, but not super interesting.
> 
> I don't think we need to be able to completely reconstruct the
> tables/chains/rules from the information in the audit log, but be aware
> of who is changing what when.

Ok.  Have a look at nf_tables_fill_gen_info() in that case, you probably
want to emit at least the pid and task info, unless audit doesn't add
that already anyway.

> > Consider a batch update that commits 100 new rules in chain x,
> > this would result in 100 audit_log_nfcfg() calls, each with the
> > same information.
> 
> So rule number would be a useful differentiator here.

Ok.  Yes, that is available (rule->handle).

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

