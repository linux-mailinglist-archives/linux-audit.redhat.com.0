Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4624F69D5A
	for <lists+linux-audit@lfdr.de>; Mon, 15 Jul 2019 23:10:26 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E7BF8308427C;
	Mon, 15 Jul 2019 21:10:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F9DB608CD;
	Mon, 15 Jul 2019 21:10:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 89BA618433A1;
	Mon, 15 Jul 2019 21:10:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6FLAGSP019814 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 15 Jul 2019 17:10:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 368D41001B16; Mon, 15 Jul 2019 21:10:16 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31BCD1001B3E
	for <linux-audit@redhat.com>; Mon, 15 Jul 2019 21:10:12 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 44B59C0495A6
	for <linux-audit@redhat.com>; Mon, 15 Jul 2019 21:10:11 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id v24so17731854ljg.13
	for <linux-audit@redhat.com>; Mon, 15 Jul 2019 14:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QqWs6tnJsgPqdUO1RETz8iVY1LYxL4xOc0UaMWvwPg0=;
	b=Jc3fkDPoiovpnK/n6pDHbPLS9nVpGOM7djQI5/ClJN/dSVYx0G2CcXdfv23vT3PanX
	Qn6AUs3nVlieQDU5Z4c7eqmhRVhmiFpAcCkovtd0tanJyIidCZd+LqSce4GoI/lUymw3
	ElQLBiBEe1Ku5Olg531yOzIB+dCJGL8uU4Lf44GoktV3dBNmKyeVkOTIuJ7cMV0EA4hN
	rcTTJVbFdwgsoDOx4fLkWerxaPeZb6F33gh+JEpagB8bKE/FmRMbnODKAMa0coDjYDqZ
	4BjkOPXxge1sCEh141rXpKRh4sAooMqCmZgsr22pRF9VCyPb2695owHUo7FbJ1nKjCGq
	vcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QqWs6tnJsgPqdUO1RETz8iVY1LYxL4xOc0UaMWvwPg0=;
	b=MQqjabaYSMJ5MmGnRukOs7gMOpJs/4dXwYLZjGEAxs3fsMrgimqe1o6kp9OViG0h9t
	TJO9YBp+Mx9ia2XfpABzWQw7mTTfrbmpGfI3w8OQHdVVDmEfFsHHcjJ598HF/cgSLt9T
	SGkxD5l7A4mkgmEKgl1Lxzu/1JN9m2Nj1sRR2WEZAjOYXvTPZxOIfzPARGFZ2VhsPspA
	r4tJAmu1QxdSj8pllhddaciDaRr98swdgLovfGHPBynBAVyjqyJKX8Kl4JGUZtDQPI/p
	yaRpcyUvTIBxenz3dHUeMIhwkZf59BoJ3r6ZVRq+gJSsZT9hTaeWgxGoaTqKiI1Ezaka
	04Cw==
X-Gm-Message-State: APjAAAXWZCvvKADStwgsDtnyVDHxtGIn2LjfjpZlJxXo3u4eHavDyAEm
	71MUV3zZoHnHcT3BnMxrPkF2gn71BF2Efy1dtA==
X-Google-Smtp-Source: APXvYqxVf+AvafI76eso5Vi9qaZvd/1ppBT5BDFcvn0IUAfeDjccWO8ASbUvznAJcvMELWLizujdPIuM3Zrv5fujIzE=
X-Received: by 2002:a2e:9dc1:: with SMTP id x1mr15382970ljj.0.1563225009574;
	Mon, 15 Jul 2019 14:10:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190529145742.GA8959@cisco>
	<CAHC9VhR4fudQanvZGYWMvCf7k2CU3q7e7n1Pi7hzC3v_zpVEdw@mail.gmail.com>
	<20190529153427.GB8959@cisco>
	<CAHC9VhSF3AjErX37+eeusJ7+XRw8yuPsmqBTRwc9EVoRBh_3Tw@mail.gmail.com>
	<20190529222835.GD8959@cisco>
	<CAHC9VhRS66VGtug3fq3RTGHDvfGmBJG6yRJ+iMxm3cxnNF-zJw@mail.gmail.com>
	<20190530170913.GA16722@mail.hallyn.com>
	<CAHC9VhThLiQzGYRUWmSuVfOC6QCDmA75BDB7Eg7V8HX4x7ymQg@mail.gmail.com>
	<20190530212900.GC5739@cisco>
	<CAHC9VhT5HPt9rCJoDutdvA3r1Y1GOHfpXe2eJ54atNC1=Vd8LA@mail.gmail.com>
	<20190708181237.5poheliito7zpvmc@madcap2.tricolour.ca>
In-Reply-To: <20190708181237.5poheliito7zpvmc@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 15 Jul 2019 17:09:58 -0400
Message-ID: <CAHC9VhT0V+xi_6nAR5TsM2vs34LbgMeO=-W+MS_kqiXRRzneZQ@mail.gmail.com>
Subject: Re: [PATCH ghak90 V6 02/10] audit: add container id
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 15 Jul 2019 21:10:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Mon, 15 Jul 2019 21:10:11 +0000 (UTC) for IP:'209.85.208.194'
	DOMAIN:'mail-lj1-f194.google.com'
	HELO:'mail-lj1-f194.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.194 mail-lj1-f194.google.com 209.85.208.194
	mail-lj1-f194.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: Tycho Andersen <tycho@tycho.ws>, nhorman@tuxdriver.com,
	linux-api@vger.kernel.org, containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, "Serge E. Hallyn" <serge@hallyn.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Mon, 15 Jul 2019 21:10:25 +0000 (UTC)

On Mon, Jul 8, 2019 at 2:12 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2019-05-30 19:26, Paul Moore wrote:

...

> > I like the creativity, but I worry that at some point these
> > limitations are going to be raised (limits have a funny way of doing
> > that over time) and we will be in trouble.  I say "trouble" because I
> > want to be able to quickly do an audit container ID comparison and
> > we're going to pay a penalty for these larger values (we'll need this
> > when we add multiple auditd support and the requisite record routing).
> >
> > Thinking about this makes me also realize we probably need to think a
> > bit longer about audit container ID conflicts between orchestrators.
> > Right now we just take the value that is given to us by the
> > orchestrator, but if we want to allow multiple container orchestrators
> > to work without some form of cooperation in userspace (I think we have
> > to assume the orchestrators will not talk to each other) we likely
> > need to have some way to block reuse of an audit container ID.  We
> > would either need to prevent the orchestrator from explicitly setting
> > an audit container ID to a currently in use value, or instead generate
> > the audit container ID in the kernel upon an event triggered by the
> > orchestrator (e.g. a write to a /proc file).  I suspect we should
> > start looking at the idr code, I think we will need to make use of it.
>
> To address this, I'd suggest that it is enforced to only allow the
> setting of descendants and to maintain a master list of audit container
> identifiers (with a hash table if necessary later) that includes the
> container owner.

We're discussing the audit container ID management policy elsewhere in
this thread so I won't comment on that here, but I did want to say
that we will likely need something better than a simple list of audit
container IDs from the start.  It's common for systems to have
thousands of containers now (or multiple thousands), which tells me
that a list is a poor choice.  You mentioned a hash table, so I would
suggest starting with that over the list for the initial patchset.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
