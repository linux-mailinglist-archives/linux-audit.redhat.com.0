Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 0329C18A73E
	for <lists+linux-audit@lfdr.de>; Wed, 18 Mar 2020 22:43:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584567786;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rFzJJDxy7/lC0mtjE9xR5ant5aalGwY4EvT3fzUyCts=;
	b=VCfnuBI0pjNi9HHAXbvfyTLQEeLN3xouoLubC0ATEzGMJOFI5yBnJmnulQj24DRXkrcgej
	LCJgIasAfiMtrDlbgr0GyuOrl40XL+nTkWosXEud8lK0JWXO90zGb9ScgmiCzVQO5o3vUA
	sj6Dg28mAuqKoJgv3LydLyRr+BXZmGQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-DqobopyDNaieDCiXAW70bw-1; Wed, 18 Mar 2020 17:42:53 -0400
X-MC-Unique: DqobopyDNaieDCiXAW70bw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6A2D149C1;
	Wed, 18 Mar 2020 21:42:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BDD285C219;
	Wed, 18 Mar 2020 21:42:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7C04B18089CD;
	Wed, 18 Mar 2020 21:42:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02ILgj6R007426 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 18 Mar 2020 17:42:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 738562166AE3; Wed, 18 Mar 2020 21:42:45 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F3CB2166B29
	for <linux-audit@redhat.com>; Wed, 18 Mar 2020 21:42:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86846185A78E
	for <linux-audit@redhat.com>; Wed, 18 Mar 2020 21:42:43 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-196-4AT-mTtfPnujd5ZKFHPZAg-1; Wed, 18 Mar 2020 17:42:41 -0400
X-MC-Unique: 4AT-mTtfPnujd5ZKFHPZAg-1
Received: by mail-ed1-f67.google.com with SMTP id h5so32815410edn.5
	for <linux-audit@redhat.com>; Wed, 18 Mar 2020 14:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wywIpBmnfonP+SMsK60nELfMnC1movwf9uyeVdD853s=;
	b=jEz7mPcmMMhH8I92OYdBMfLcFCHebEnxWXRUvQWO3B1Xdn64/60Y2UpR8V7nIn3s44
	bOKuX97SLDgVvHt/d4lnXnwHmBBhF8naoORfHbOrPCtdg/RBzIvyu+nBq945/ewJ9Ew/
	D0aTUgEkbskruS7XFytSl2VPRDa/BGpdouUrqEIkK1amFPExS0dB8Ps/S0yGOOPf3W+0
	DgnqTHTaKF1B4XZ/4FBetU4y6LKxZyCTH5ml2zC9eibZBKxTHxYZREisWtneGrXA1eU5
	A8ZtM/hFFi5N3wnl5eLE/VNXe43afQscMfcCwPzxhxq2oOBgMX1EH3S2W7nQlEpWCjDQ
	lYJw==
X-Gm-Message-State: ANhLgQ1ayOVJ04iFVQ2/Uq+979zbwvPsabZjtkeRwXnZksRxVllavWN6
	eGjeR+ZSmGtYLJxQWc7SVa+Rj/IrXoNsa05lXkze
X-Google-Smtp-Source: ADFU+vsFfxpWZoWPoQfNzQoKkFTZAgqPPLMBHZEXieGrsLv/NxY4XpzprF2kknyaJZWIiPi4S6FHLOmCkd5dO3fhL3E=
X-Received: by 2002:aa7:dd01:: with SMTP id i1mr5988476edv.164.1584567759671; 
	Wed, 18 Mar 2020 14:42:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1577736799.git.rgb@redhat.com>
	<20200204231454.oxa7pyvuxbj466fj@madcap2.tricolour.ca>
	<CAHC9VhQquokw+7UOU=G0SsD35UdgmfysVKCGCE87JVaoTkbisg@mail.gmail.com>
	<3142237.YMNxv0uec1@x2>
	<CAHC9VhTiCHQbp2SwK0Xb1QgpUZxOQ26JKKPsVGT0ZvMqx28oPQ@mail.gmail.com>
	<CAHC9VhS09b_fM19tn7pHZzxfyxcHnK+PJx80Z9Z1hn8-==4oLA@mail.gmail.com>
	<20200312193037.2tb5f53yeisfq4ta@madcap2.tricolour.ca>
	<CAHC9VhQoVOzy_b9W6h+kmizKr1rPkC4cy5aYoKT2i0ZgsceNDg@mail.gmail.com>
	<20200313185900.y44yvrfm4zxa5lfk@madcap2.tricolour.ca>
	<CAHC9VhR2zCCE5bjH75rSwfLC7TJGFj4RBnrtcOoUiqVp9q5TaA@mail.gmail.com>
	<20200318212630.mw2geg4ykhnbtr3k@madcap2.tricolour.ca>
In-Reply-To: <20200318212630.mw2geg4ykhnbtr3k@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 18 Mar 2020 17:42:28 -0400
Message-ID: <CAHC9VhRYvGAru3aOMwWKCCWDktS+2pGr+=vV4SjHW_0yewD98A@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 07/16] audit: add contid support for signalling
	the audit daemon
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02ILgj6R007426
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	linux-audit@redhat.com, netfilter-devel@vger.kernel.org,
	ebiederm@xmission.com, simo@redhat.com, netdev@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 18, 2020 at 5:27 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-03-18 16:56, Paul Moore wrote:
> > On Fri, Mar 13, 2020 at 2:59 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > On 2020-03-13 12:29, Paul Moore wrote:
> > > > On Thu, Mar 12, 2020 at 3:30 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > > > On 2020-02-13 16:44, Paul Moore wrote:
> > > > > > This is a bit of a thread-hijack, and for that I apologize, but
> > > > > > another thought crossed my mind while thinking about this issue
> > > > > > further ... Once we support multiple auditd instances, including the
> > > > > > necessary record routing and duplication/multiple-sends (the host
> > > > > > always sees *everything*), we will likely need to find a way to "trim"
> > > > > > the audit container ID (ACID) lists we send in the records.  The
> > > > > > auditd instance running on the host/initns will always see everything,
> > > > > > so it will want the full container ACID list; however an auditd
> > > > > > instance running inside a container really should only see the ACIDs
> > > > > > of any child containers.
> > > > >
> > > > > Agreed.  This should be easy to check and limit, preventing an auditd
> > > > > from seeing any contid that is a parent of its own contid.
> > > > >
> > > > > > For example, imagine a system where the host has containers 1 and 2,
> > > > > > each running an auditd instance.  Inside container 1 there are
> > > > > > containers A and B.  Inside container 2 there are containers Y and Z.
> > > > > > If an audit event is generated in container Z, I would expect the
> > > > > > host's auditd to see a ACID list of "1,Z" but container 1's auditd
> > > > > > should only see an ACID list of "Z".  The auditd running in container
> > > > > > 2 should not see the record at all (that will be relatively
> > > > > > straightforward).  Does that make sense?  Do we have the record
> > > > > > formats properly designed to handle this without too much problem (I'm
> > > > > > not entirely sure we do)?
> > > > >
> > > > > I completely agree and I believe we have record formats that are able to
> > > > > handle this already.
> > > >
> > > > I'm not convinced we do.  What about the cases where we have a field
> > > > with a list of audit container IDs?  How do we handle that?
> > >
> > > I don't understand the problem.  (I think you crossed your 1/2 vs
> > > A/B/Y/Z in your example.) ...
> >
> > It looks like I did, sorry about that.
> >
> > > ... Clarifying the example above, if as you
> > > suggest an event happens in container Z, the hosts's auditd would report
> > >         Z,^2
> > > and the auditd in container 2 would report
> > >         Z,^2
> > > but if there were another auditd running in container Z it would report
> > >         Z
> > > while the auditd in container 1 or A/B would see nothing.
> >
> > Yes.  My concern is how do we handle this to minimize duplicating and
> > rewriting the records?  It isn't so much about the format, although
> > the format is a side effect.
>
> Are you talking about caching, or about divulging more information than
> necessary or even information leaks?  Or even noticing that records that
> need to be generated to two audit daemons share the same contid field
> values and should be generated at the same time or information shared
> between them?  I'd see any of these as optimizations that don't affect
> the api.

Imagine a record is generated in a container which has more than one
auditd in it's ancestry that should receive this record, how do we
handle that without completely killing performance?  That's my
concern.  If you've already thought up a plan for this - excellent,
please share :)

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

