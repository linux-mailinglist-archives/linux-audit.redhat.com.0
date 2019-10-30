Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9B1EA4CF
	for <lists+linux-audit@lfdr.de>; Wed, 30 Oct 2019 21:33:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572467609;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qZ8qsMwyBjFrLzCxqSEvcLHw1mYYf9q5AxEb5gn1OS8=;
	b=cDHMjV1s5NhQ1BCldqdf/tQH5GctIqicO6hJ896JanSxoVIbcQGSOQ9DA9kjfDAPgpNZP9
	D/MsmsApVl6wX35wf87Ak2/qrzqKfJcU1kMRRC0Bh3TcCp4Xw5HeJzeeMp7Yja9UHXpwcP
	26Ac4IKeXpSEc7YnIcmine1mDuUYqwg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-VWewTZ7NMC2Kfa0vWu6oig-1; Wed, 30 Oct 2019 16:33:25 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CA28800EB4;
	Wed, 30 Oct 2019 20:33:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 605955C21B;
	Wed, 30 Oct 2019 20:33:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3F7044BB65;
	Wed, 30 Oct 2019 20:33:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9UKXAVO032077 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 30 Oct 2019 16:33:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 478D35C28E; Wed, 30 Oct 2019 20:33:10 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42B345C241
	for <linux-audit@redhat.com>; Wed, 30 Oct 2019 20:33:07 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3F36B3084242
	for <linux-audit@redhat.com>; Wed, 30 Oct 2019 20:33:07 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id a21so4136464ljh.9
	for <linux-audit@redhat.com>; Wed, 30 Oct 2019 13:33:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PZw4hUcpDDeEECYWt5oKzqEsWCt5if9tCmjtkMvGZZc=;
	b=nd1ufoMZEvk4kHpPiXC5F4vjJLKr+N/cXhUVJn21hTnPJ0ltivx7ynbXJ/Pldp3oQa
	u2ehlfPKxH0rvd+/BNyTFnM6WGBW5f6DfM2lx3PWJIDQNGNdju2T7aRn1zUWb6yMv6HA
	PvE30v1THUkKjnJdPrCiYReL/APN6KVpAQtVSlyvVpU0spke/AN2Okau/xipTUd7Gftm
	tf939OR2heSpV60ISk+eEj/cS/ytwUVKHQtoPLaoeVmpxITLPwxmYWk+wSN91gr7pYXX
	8+L3Y4RQ6EIJ1erb1rlKbL6ZRkVFbmX1Pk5k3+vhQAk1VqTcqFjaWcirksgFvf9qSy1B
	exBw==
X-Gm-Message-State: APjAAAXR4WCgCpDuG+Q33X9jEhKuluzHJfHZ2xoAu9cXRXGWigGni6M5
	xzV8jAQe+ccSD1mJbZkwgsRBGkEsQ5Wm4litEumLopVSVmJo
X-Google-Smtp-Source: APXvYqyiyj85p5hWvRdH63/Hex6oBbr4Qp3fVRiaxpwF74z1TwPKum1fWCiiIky+FvzFDsHURjcemP+RjH0Szm1Yw/g=
X-Received: by 2002:a2e:8987:: with SMTP id c7mr1107993lji.225.1572467585472; 
	Wed, 30 Oct 2019 13:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1568834524.git.rgb@redhat.com>
	<16abf1b2aafeb5f1b8dae20b9a4836e54f959ca5.1568834524.git.rgb@redhat.com>
	<CAHC9VhSRmn46DcazH4Q35vOSxVoEu8PsX79aurkHkFymRoMwag@mail.gmail.com>
	<20191024220814.pid5ql6kvyr4ianb@madcap2.tricolour.ca>
In-Reply-To: <20191024220814.pid5ql6kvyr4ianb@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 30 Oct 2019 16:32:54 -0400
Message-ID: <CAHC9VhTEpVLgKk1FpFqaXH-B1jUvfRyaGffHwFrHbi3MjbRrUA@mail.gmail.com>
Subject: Re: [PATCH ghak90 V7 14/21] audit: contid check descendancy and
	nesting
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Wed, 30 Oct 2019 20:33:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Wed, 30 Oct 2019 20:33:07 +0000 (UTC) for IP:'209.85.208.193'
	DOMAIN:'mail-lj1-f193.google.com'
	HELO:'mail-lj1-f193.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.193 mail-lj1-f193.google.com 209.85.208.193
	mail-lj1-f193.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: VWewTZ7NMC2Kfa0vWu6oig-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2019 at 6:08 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2019-10-10 20:40, Paul Moore wrote:
> > On Wed, Sep 18, 2019 at 9:26 PM Richard Guy Briggs <rgb@redhat.com> wro=
te:
> > > ?fixup! audit: convert to contid list to check for orch/engine owners=
hip
> >
> > ?
> >
> > > Require the target task to be a descendant of the container
> > > orchestrator/engine.
> > >
> > > You would only change the audit container ID from one set or inherite=
d
> > > value to another if you were nesting containers.
> > >
> > > If changing the contid, the container orchestrator/engine must be a
> > > descendant and not same orchestrator as the one that set it so it is =
not
> > > possible to change the contid of another orchestrator's container.
> >
> > Did you mean to say that the container orchestrator must be an
> > ancestor of the target, and the same orchestrator as the one that set
> > the target process' audit container ID?
>
> Not quite, the first half yes, but the second half: if it was already
> set by that orchestrator, it can't be set again.  If it is a different
> orchestrator that is a descendant of the orchestrator that set it, then
> allow the action.
>
> > Or maybe I'm missing something about what you are trying to do?
>
> Does that help clarify it?

I think so, it's pretty much as you stated originally: "Require the
target task to be a descendant of the container orchestrator/engine".
It's possible I misread something in the patch, or got lost in all the
?fixup! patching.  I'll take a closer look at the next revision of the
patchset to make sure the code makes sense to me, but the logic seems
reasonable.

--=20
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

