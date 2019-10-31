Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4497AEB1F0
	for <lists+linux-audit@lfdr.de>; Thu, 31 Oct 2019 15:00:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572530442;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=M0o/pCl+FVgLeaNA9sANQh8/PWRCOpsq2tE5SI9mB5A=;
	b=OoDaYanB1I/A0l3Grsr4XwI3Q7VFt72YnrY3HyhEm+iBjgDLRa/8x6ELjR7YUjFQoKP4bm
	bmVzg0DzlqjRzyphJwYXMZbLCwQmE19axm+JTAdLRLhrLVTwcvSGjPFTJ+cLJuTLbyF6/u
	feTtR8C74q/Qdv4Jc+3vCZiOpyoSfgU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-IpMuaAE2PUadZen0oegGyA-1; Thu, 31 Oct 2019 10:00:39 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B8F71800D55;
	Thu, 31 Oct 2019 14:00:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B38BC26578;
	Thu, 31 Oct 2019 14:00:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5A0FF18089CE;
	Thu, 31 Oct 2019 14:00:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9VE0Ag8016084 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 31 Oct 2019 10:00:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D87B265E84; Thu, 31 Oct 2019 14:00:10 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE22863764
	for <linux-audit@redhat.com>; Thu, 31 Oct 2019 14:00:04 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 59971C04BE1B
	for <linux-audit@redhat.com>; Thu, 31 Oct 2019 14:00:02 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id s4so6726805ljj.10
	for <linux-audit@redhat.com>; Thu, 31 Oct 2019 07:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DuatfVoIRwFhp1fiwVqEQDhLv5NKcD5+eL4mURteBJw=;
	b=bL8wM1Gb77IICNLFEXPIMI6/62852KFkVK/tNMgt8sJRlvfdd5BYGkTL8+YQkzsWER
	UXlpX2VpDO4t0CuqrG2rhVlQv4cQ/dwukknt5LNNSTmtBheFNDmWdawzXhAzWm1dBB/1
	YTkANybADVVW96Isl8uGi8l8Kb3oVt0LHMvw0q9GmMwELtTvv6sKruUeJ27q+qgGyCvz
	/ETTOXMPD247PH3PZVjOtHtlQY9Z4QYmUOoQtDSmJh4n7VNk692xfDAu0tddI2kiDNxT
	4mvSwxvcuhMajqb/q2fxHZzy93KCDgeLXd1MsWTNHOKdIG8XQE8W7FXLiDR+KC0expBw
	tgyg==
X-Gm-Message-State: APjAAAV3GVWrwOObQIYop8ZWo2Due8FrG6yqUAUeUi34hw2cysdTdYb/
	mViM1MCaS7zUsEHZQ8rftfBawCbYX30hOukW27zI
X-Google-Smtp-Source: APXvYqwq2wNVb076m3Quvyq9PXqhSEvG470R+68J3/Y3Ahcr5xKs7JewCzfRlqwmRAqfj89jdi6yOS5N64nrB3PIo6A=
X-Received: by 2002:a05:651c:1056:: with SMTP id
	x22mr1097948ljm.225.1572530400425; 
	Thu, 31 Oct 2019 07:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1568834524.git.rgb@redhat.com>
	<214163d11a75126f610bcedfad67a4d89575dc77.1568834525.git.rgb@redhat.com>
	<20191019013904.uevmrzbmztsbhpnh@madcap2.tricolour.ca>
	<CAHC9VhRPygA=LsHLUqv+K=ouAiPFJ6fb2_As=OT-_zB7kGc_aQ@mail.gmail.com>
	<20191021213824.6zti5ndxu7sqs772@madcap2.tricolour.ca>
	<CAHC9VhRdNXsY4neJpSoNyJoAVEoiEc2oW5kSscF99tjmoQAxFA@mail.gmail.com>
	<20191021235734.mgcjotdqoe73e4ha@madcap2.tricolour.ca>
	<CAHC9VhSiwnY-+2awxvGeO4a0NgfVkOPd8fzzBVujp=HtjskTuQ@mail.gmail.com>
	<20191024210010.owwgc3bqbvtdsqws@madcap2.tricolour.ca>
	<CAHC9VhRDoX9du4XbCnBtBzsNPMGOsb-TKM1CC+sCL7HP=FuTRQ@mail.gmail.com>
	<20191030220320.tnwkaj5gbzchcn7j@madcap2.tricolour.ca>
In-Reply-To: <20191030220320.tnwkaj5gbzchcn7j@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 31 Oct 2019 09:59:48 -0400
Message-ID: <CAHC9VhTKaBwFxEnY9vLRgtZ5ptQzF-WvwiAyVgtTNn6tt4bZqw@mail.gmail.com>
Subject: Re: [PATCH ghak90 V7 20/21] audit: add capcontid to set contid
	outside init_user_ns
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 31 Oct 2019 14:00:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Thu, 31 Oct 2019 14:00:02 +0000 (UTC) for IP:'209.85.208.194'
	DOMAIN:'mail-lj1-f194.google.com'
	HELO:'mail-lj1-f194.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.194 mail-lj1-f194.google.com 209.85.208.194
	mail-lj1-f194.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: IpMuaAE2PUadZen0oegGyA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2019 at 6:04 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2019-10-30 16:27, Paul Moore wrote:
> > On Thu, Oct 24, 2019 at 5:00 PM Richard Guy Briggs <rgb@redhat.com> wro=
te:
> > > Here's the note I had from that meeting:
> > >
> > > - Eric raised the issue that using /proc is likely to get more and mo=
re
> > >   hoary due to mount namespaces and suggested that we use a netlink
> > > audit message (or a new syscall) to set the audit container identifie=
r
> > > and since the loginuid is a similar type of operation, that it should=
 be
> > > migrated over to a similar mechanism to get it away from /proc.  Get
> > > could be done with a netlink audit message that triggers an audit log
> > > message to deliver the information.  I'm reluctant to further pollute
> > > the syscall space if we can find another method.  The netlink audit
> > > message makes sense since any audit-enabled service is likely to alre=
ady
> > > have an audit socket open.
> >
> > Thanks for the background info on the off-list meeting.  I would
> > encourage you to have discussions like this on-list in the future; if
> > that isn't possible, hosting a public call would okay-ish, but a
> > distant second.
>
> I'm still trying to get Eric's attention to get him to weigh in here and
> provide a more eloquent representation of his ideas and concerns.  Some
> of it was related to CRIU(sp?) issues which we've already of which we've
> already seen similar concerns in namespace identifiers including the
> device identity to qualify it.

Okay, let's leave this open until we hear from Eric to see if he has
any additional information, but it's going to need to be pretty
compelling.

> > At this point in time I'm not overly concerned about /proc completely
> > going away in namespaces/containers that are full featured enough to
> > host a container orchestrator.  If/when reliance on procfs becomes an
> > issue, we can look at alternate APIs, but given the importance of
> > /proc to userspace (including to audit) I suspect we are going to see
> > it persist for some time.  I would prefer to see you to drop the audit
> > container ID netlink API portions of this patchset and focus on the
> > procfs API.
>
> I've already refactored the code to put the netlink bits at the end as
> completely optional pieces for completeness so they won't get in the way
> of the real substance of this patchset.  The nesting depth and total
> number of containers checks have also been punted to the end of the
> patchset to get them out of the way of discussion.

That's fine, but if we do decide to drop the netlink API after hearing
from Eric, please drop those from the patchset.  Keeping the patchset
small and focused should be a goal, and including rejected/dead
patches (even at the end) doesn't help move towards that goal.

> > Also, for the record, removing the audit loginuid from procfs is not
> > something to take lightly, if at all; like it or not, it's part of the
> > kernel API.
>
> Oh, I'm quite aware of how important this change is and it was discussed
> with Steve Grubb who saw the concern and value of considering such a
> disruptive change.  Removing proc support for auid/ses would be a
> long-term deprecation if accepted.

As I mentioned, that comment was more "for the record" than you in
particular; I know we've talked a lot over the years about kernel API
stability and I'm confident you are aware of the pitfalls there. :)

--=20
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

