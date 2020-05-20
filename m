Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF2A1DBD6F
	for <lists+linux-audit@lfdr.de>; Wed, 20 May 2020 20:59:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590001188;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=p9HJidsL59LsIVZYBQHbBr0CTowKvFarUUoIAIkxF6U=;
	b=dzmckYP66kjcr9ZQ8kMWI1AZYI14RBUkvircBwsQ9GHPprxnYmly/hmvw9RVEzufsIfncR
	lWoGsfJDJwBH427Q6rb8jKbX8Jfb3BAYTez4iasvnUKx4Nxq2P4B9+zGVT0/yL/yhcTeAU
	DT1xH//ZRre1QP5E0LfQR5z8JsBBAX0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-Tgrie_GSPMOanrcqeVwPyA-1; Wed, 20 May 2020 14:59:45 -0400
X-MC-Unique: Tgrie_GSPMOanrcqeVwPyA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60023800688;
	Wed, 20 May 2020 18:59:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E84C85D9CA;
	Wed, 20 May 2020 18:59:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 427CF1809543;
	Wed, 20 May 2020 18:59:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04KIxWxA026171 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 20 May 2020 14:59:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D4D4782A1B; Wed, 20 May 2020 18:59:32 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 40BFF7D96E;
	Wed, 20 May 2020 18:59:25 +0000 (UTC)
Date: Wed, 20 May 2020 14:59:22 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Steve Grubb <sgrubb@redhat.com>
Subject: Re: [PATCH ghak25 v6] audit: add subj creds to NETFILTER_CFG record
	to cover async unregister
Message-ID: <20200520185922.vnutg5z3hwp7grjm@madcap2.tricolour.ca>
References: <a585b9933896bc542347d8f3f26b08005344dd84.1589920939.git.rgb@redhat.com>
	<20200520165510.4l4q47vq6fyx7hh6@madcap2.tricolour.ca>
	<CAHC9VhRERV9_kgpcn2LBptgXGY0BB4A9CHT+V4-HFMcNd9_Ncg@mail.gmail.com>
	<17476338.hsbNre52Up@x2>
MIME-Version: 1.0
In-Reply-To: <17476338.hsbNre52Up@x2>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
Cc: fw@strlen.de, LKML <linux-kernel@vger.kernel.org>, linux-audit@redhat.com,
	netfilter-devel@vger.kernel.org, twoerner@redhat.com,
	Eric Paris <eparis@parisplace.org>, tgraf@infradead.org
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

On 2020-05-20 14:51, Steve Grubb wrote:
> On Wednesday, May 20, 2020 2:40:45 PM EDT Paul Moore wrote:
> > On Wed, May 20, 2020 at 12:55 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > On 2020-05-20 12:51, Richard Guy Briggs wrote:
> > > > Some table unregister actions seem to be initiated by the kernel to
> > > > garbage collect unused tables that are not initiated by any userspace
> > > > actions.  It was found to be necessary to add the subject credentials
> > > > to cover this case to reveal the source of these actions.  A sample
> > > > record:
> > > > 
> > > > The uid, auid, tty, ses and exe fields have not been included since
> > > > they
> > > > are in the SYSCALL record and contain nothing useful in the non-user
> > > > context.
> > > > 
> > > >   type=NETFILTER_CFG msg=audit(2020-03-11 21:25:21.491:269) : table=nat
> > > >   family=bridge entries=0 op=unregister pid=153
> > > >   subj=system_u:system_r:kernel_t:s0 comm=kworker/u4:2
> >
> > FWIW, that record looks good.
> 
> It's severely broken
> 
> cat log.file
> type=NETFILTER_CFG msg=audit(2020-03-11 21:25:21.491:269) : table=nat 
> family=bridge entries=0 op=unregister pid=153 
> subj=system_u:system_r:kernel_t:s0 comm=kworker/u4:2
> 
> ausearch -if log.file --format text
> At 19:33:40 12/31/1969  did-unknown 
> 
> ausearch -if log.file --format csv
> NODE,EVENT,DATE,TIME,SERIAL_NUM,EVENT_KIND,SESSION,SUBJ_PRIME,SUBJ_SEC,SUBJ_KIND,ACTION,RESULT,OBJ_PRIME,OBJ_SEC,OBJ_KIND,HOW
> error normalizing NETFILTER_CFG
> ,NETFILTER_CFG,12/31/1969,19:33:40,0,,,,,,,,,,
> 
> This is unusable. This is why the bug was filed in the first place.

Have you applied this patchset?
	https://www.redhat.com/archives/linux-audit/2020-May/msg00072.html

AUDIT_EVENT_LISTENER is also broken without this first patch.

> -Steve
> 
> > > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > 
> > > Self-NACK.  I forgot to remove cred and tty declarations.

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

