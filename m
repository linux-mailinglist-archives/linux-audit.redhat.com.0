Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 82C53E00DF
	for <lists+linux-audit@lfdr.de>; Tue, 22 Oct 2019 11:38:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571737096;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rBNM1LBEHGX1mxt4DK1u4xluUFXumtjmjH0zt0Ao/FM=;
	b=LiBqTvGEx6/2KmLG2bjNs0tC5KgeW0WucWddIPy978Xe6z/PMXGFHKIhm1moQNqGHkgM+S
	hc0yo9PjniVHLWtGu/rskPndu1BQFOrvtclisPXE2BgnVFyUc0zSZMGATlmQm3JQBRhEMK
	KVslj1L+9MO9AKOGGZDKSyMAxgkBilc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-UfE5gw9LPO-OT6FE5hagAA-1; Tue, 22 Oct 2019 05:38:14 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2048107AD33;
	Tue, 22 Oct 2019 09:38:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E75765D70E;
	Tue, 22 Oct 2019 09:38:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4E6131A500;
	Tue, 22 Oct 2019 09:38:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9LLcjsF012097 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 21 Oct 2019 17:38:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D4D2C10027A9; Mon, 21 Oct 2019 21:38:45 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-19.phx2.redhat.com [10.3.112.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2D4E1001B20;
	Mon, 21 Oct 2019 21:38:27 +0000 (UTC)
Date: Mon, 21 Oct 2019 17:38:24 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 V7 20/21] audit: add capcontid to set contid
	outside init_user_ns
Message-ID: <20191021213824.6zti5ndxu7sqs772@madcap2.tricolour.ca>
References: <cover.1568834524.git.rgb@redhat.com>
	<214163d11a75126f610bcedfad67a4d89575dc77.1568834525.git.rgb@redhat.com>
	<20191019013904.uevmrzbmztsbhpnh@madcap2.tricolour.ca>
	<CAHC9VhRPygA=LsHLUqv+K=ouAiPFJ6fb2_As=OT-_zB7kGc_aQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhRPygA=LsHLUqv+K=ouAiPFJ6fb2_As=OT-_zB7kGc_aQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: UfE5gw9LPO-OT6FE5hagAA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 2019-10-21 15:53, Paul Moore wrote:
> On Fri, Oct 18, 2019 at 9:39 PM Richard Guy Briggs <rgb@redhat.com> wrote=
:
> > On 2019-09-18 21:22, Richard Guy Briggs wrote:
> > > Provide a mechanism similar to CAP_AUDIT_CONTROL to explicitly give a
> > > process in a non-init user namespace the capability to set audit
> > > container identifiers.
> > >
> > > Use audit netlink message types AUDIT_GET_CAPCONTID 1027 and
> > > AUDIT_SET_CAPCONTID 1028.  The message format includes the data
> > > structure:
> > > struct audit_capcontid_status {
> > >         pid_t   pid;
> > >         u32     enable;
> > > };
> >
> > Paul, can I get a review of the general idea here to see if you're ok
> > with this way of effectively extending CAP_AUDIT_CONTROL for the sake o=
f
> > setting contid from beyond the init user namespace where capable() can'=
t
> > reach and ns_capable() is meaningless for these purposes?
>=20
> I think my previous comment about having both the procfs and netlink
> interfaces apply here.  I don't see why we need two different APIs at
> the start; explain to me why procfs isn't sufficient.  If the argument
> is simply the desire to avoid mounting procfs in the container, how
> many container orchestrators can function today without a valid /proc?

Ok, sorry, I meant to address that question from a previous patch
comment at the same time.

It was raised by Eric Biederman that the proc filesystem interface for
audit had its limitations and he had suggested an audit netlink
interface made more sense.

The intent was to switch to the audit netlink interface for contid,
capcontid and to add the audit netlink interface for loginuid and
sessionid while deprecating the proc interface for loginuid and
sessionid.  This was alluded to in the cover letter, but not very clear,
I'm afraid.  I have patches to remove the contid and loginuid/sessionid
interfaces in another tree which is why I had forgotten to outline that
plan more explicitly in the cover letter.

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

