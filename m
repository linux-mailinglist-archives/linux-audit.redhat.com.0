Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 76E1818A720
	for <lists+linux-audit@lfdr.de>; Wed, 18 Mar 2020 22:33:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584567236;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=boNbwS9rMTVj8Hv+Jz+Oj9LKbtroiZqrXCrMNtwKwAU=;
	b=Jyn7A9/hcUCJ4518AVguoo5GuyfNZgiMoSoOjq/Il6NyC65QzC0FB8rV2db6cpiIVcyeiJ
	O4FbUcOCip6lJ+uDwJHR1+Yo/d3mYgVryO5AQ29dH3na2I4gl4l7qPef8q6iHZn0ObZMjq
	noyM9j9lJua0ze3RjRS1uAtXOyLw9Og=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-zf_ggkm_OGSwnJhprv0Z0Q-1; Wed, 18 Mar 2020 17:33:54 -0400
X-MC-Unique: zf_ggkm_OGSwnJhprv0Z0Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C2728017CC;
	Wed, 18 Mar 2020 21:33:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AF315D9E5;
	Wed, 18 Mar 2020 21:33:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3852A18089CD;
	Wed, 18 Mar 2020 21:33:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02ILXgEc007137 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 18 Mar 2020 17:33:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 181E45DA7C; Wed, 18 Mar 2020 21:33:42 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.36.110.5])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DDF0C5D9E5;
	Wed, 18 Mar 2020 21:33:31 +0000 (UTC)
Date: Wed, 18 Mar 2020 17:33:27 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak25 v3 3/3] audit: add subj creds to NETFILTER_CFG
	record to cover async unregister
Message-ID: <20200318213327.ow22q6nnjn3ijq6v@madcap2.tricolour.ca>
References: <cover.1584480281.git.rgb@redhat.com>
	<13ef49b2f111723106d71c1bdeedae09d9b300d8.1584480281.git.rgb@redhat.com>
	<20200318131128.axyddgotzck7cit2@madcap2.tricolour.ca>
	<CAHC9VhTdLZop0eT11H4uSXRj5M=kBet=GkA8taDwGN_BVMyhrQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhTdLZop0eT11H4uSXRj5M=kBet=GkA8taDwGN_BVMyhrQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
Cc: fw@strlen.de, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	twoerner@redhat.com, Eric Paris <eparis@parisplace.org>,
	tgraf@infradead.org
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
Content-Disposition: inline

On 2020-03-18 17:22, Paul Moore wrote:
> On Wed, Mar 18, 2020 at 9:12 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2020-03-17 17:30, Richard Guy Briggs wrote:
> > > Some table unregister actions seem to be initiated by the kernel to
> > > garbage collect unused tables that are not initiated by any userspace
> > > actions.  It was found to be necessary to add the subject credentials to
> > > cover this case to reveal the source of these actions.  A sample record:
> > >
> > >   type=NETFILTER_CFG msg=audit(2020-03-11 21:25:21.491:269) : table=nat family=bridge entries=0 op=unregister pid=153 uid=root auid=unset tty=(none) ses=unset subj=system_u:system_r:kernel_t:s0 comm=kworker/u4:2 exe=(null)
> >
> > Given the precedent set by bpf unload, I'd really rather drop this patch
> > that adds subject credentials.
> >
> > Similarly with ghak25's subject credentials, but they were already
> > present and that would change an existing record format, so it isn't
> > quite as justifiable in that case.
> 
> Your comments have me confused - do you want this patch (v3 3/3)
> considered for merging or no?

I would like it considered for merging if you think it will be required
to provide enough information about the event that happenned.  In the
bpf unload case, there is a program number to provide a link to a
previous load action.  In this case, we won't know for sure what caused
the table to be unloaded if the number of entries was empty.  I'm still
trying to decide if it matters.  For the sake of caution I think it
should be included.  I don't like it, but I think it needs to be
included.

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

