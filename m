Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E061669CEB
	for <lists+linux-audit@lfdr.de>; Mon, 15 Jul 2019 22:39:01 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6C49630832DA;
	Mon, 15 Jul 2019 20:38:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A7AC95DA34;
	Mon, 15 Jul 2019 20:38:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 460384EA69;
	Mon, 15 Jul 2019 20:38:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6FKcgSR015238 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 15 Jul 2019 16:38:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 17ED41001B17; Mon, 15 Jul 2019 20:38:42 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 131DB1001B0C
	for <linux-audit@redhat.com>; Mon, 15 Jul 2019 20:38:39 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 27FB383F51
	for <linux-audit@redhat.com>; Mon, 15 Jul 2019 20:38:38 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id x25so17663882ljh.2
	for <linux-audit@redhat.com>; Mon, 15 Jul 2019 13:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SPYn0kigh/YyOOP3JdYIDFFrsPtkvgbvu1zMyQDVf3M=;
	b=b5eOePLKODPIzr8swDyYF4AgFldz7V2YABrA3742nAOHLzAo2/ozBZ0RJ8D5vddpk3
	sARlE/+axrtAh0KzWih8Ly0xxU5yIYpkYX1vuY4Ipmgobv3qAB/1jGKDo3KylvK7eHSd
	4sJcUaNpn2Mo0wTr/tITuzI5VkAFW1+L/TggkgJyTaDX57KahSyYfLsipraO3VrBagKt
	5af5hO2j+xukaou6B0ox1R1O0J8iM7BVCBnKA5cz6PdIvdxQIVHl7YCSpLQAA4Z6I3Z2
	jiNXl2hfASd4OE8vuNF//VDxwoQHOiejs0XJsKihnYXyCJwArlLVd3jylh7ferlCZnUf
	1LIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SPYn0kigh/YyOOP3JdYIDFFrsPtkvgbvu1zMyQDVf3M=;
	b=N7hN799+Am05lopjZ48uwoRZGBM/wAGHuU7i9sBKr5O066YavSF7HszCsdbu9gShk1
	alCC1Io9VS5iL4Ma9NjpMrUF+UkKySEEqZz6gcBGDAWexsrNN7uQ31s7txuNYA95DpIl
	j4SvhOU1gXByVZutVkV3u4bsbeq/eH7kWOcziR8VkhiZUqZm2xb81rEcGp64h35pKK7B
	MzIGYTGe2eoMmWjozWdyAAzNUypU1cRHQg72yzKOKpbswNbKnaNg7nOWY4bseLnl6YVw
	67LNEA8vsICnZcPBOtnil/xqG4opb+FZ9qiDqKx/7IaheU3I6aRBItDTeSizCvlZ25q7
	v2Dw==
X-Gm-Message-State: APjAAAUoVFmEYQ/cVYPxg5hmyT1wGlIrlx/A1+snLdgpa6raXKRV6xSj
	YKAJBeCHSQcaVAH3B/DYE2X/Izi4HgEbNsNG7w==
X-Google-Smtp-Source: APXvYqy7ph4w7wyU2yk8+QNPGuKGKilYKae2+aEm11FJ7Oxrse5chHU3V+2dKv4MLJ5f+7kkorTp67H+wXIXoLMuFPs=
X-Received: by 2002:a2e:3604:: with SMTP id d4mr15091488lja.85.1563223116334; 
	Mon, 15 Jul 2019 13:38:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1554732921.git.rgb@redhat.com>
	<9edad39c40671fb53f28d76862304cc2647029c6.1554732921.git.rgb@redhat.com>
	<20190529145742.GA8959@cisco>
	<CAHC9VhR4fudQanvZGYWMvCf7k2CU3q7e7n1Pi7hzC3v_zpVEdw@mail.gmail.com>
	<20190708175105.7zb6mikjw2wmnwln@madcap2.tricolour.ca>
In-Reply-To: <20190708175105.7zb6mikjw2wmnwln@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 15 Jul 2019 16:38:25 -0400
Message-ID: <CAHC9VhRFeCFSCn=m6wgDK2tXBN1euc2+bw8o=CfNwptk8t=j7A@mail.gmail.com>
Subject: Re: [PATCH ghak90 V6 02/10] audit: add container id
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 15 Jul 2019 20:38:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Mon, 15 Jul 2019 20:38:38 +0000 (UTC) for IP:'209.85.208.195'
	DOMAIN:'mail-lj1-f195.google.com'
	HELO:'mail-lj1-f195.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.195 mail-lj1-f195.google.com 209.85.208.195
	mail-lj1-f195.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: Tycho Andersen <tycho@tycho.ws>, nhorman@tuxdriver.com,
	linux-api@vger.kernel.org, containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, Serge Hallyn <serge@hallyn.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Mon, 15 Jul 2019 20:39:00 +0000 (UTC)

On Mon, Jul 8, 2019 at 1:51 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2019-05-29 11:29, Paul Moore wrote:

...

> > The idea is that only container orchestrators should be able to
> > set/modify the audit container ID, and since setting the audit
> > container ID can have a significant effect on the records captured
> > (and their routing to multiple daemons when we get there) modifying
> > the audit container ID is akin to modifying the audit configuration
> > which is why it is gated by CAP_AUDIT_CONTROL.  The current thinking
> > is that you would only change the audit container ID from one
> > set/inherited value to another if you were nesting containers, in
> > which case the nested container orchestrator would need to be granted
> > CAP_AUDIT_CONTROL (which everyone to date seems to agree is a workable
> > compromise).  We did consider allowing for a chain of nested audit
> > container IDs, but the implications of doing so are significant
> > (implementation mess, runtime cost, etc.) so we are leaving that out
> > of this effort.
>
> We had previously discussed the idea of restricting
> orchestrators/engines from only being able to set the audit container
> identifier on their own descendants, but it was discarded.  I've added a
> check to ensure this is now enforced.

When we weren't allowing nested orchestrators it wasn't necessary, but
with the move to support nesting I believe this will be a requirement.
We might also need/want to restrict audit container ID changes if a
descendant is acting as a container orchestrator and managing one or
more audit container IDs; although I'm less certain of the need for
this.

> I've also added a check to ensure that a process can't set its own audit
> container identifier ...

What does this protect against, or what problem does this solve?
Considering how easy it is to fork/exec, it seems like this could be
trivially bypassed.

> ... and that if the identifier is already set, then the
> orchestrator/engine must be in a descendant user namespace from the
> orchestrator that set the previously inherited audit container
> identifier.

You lost me here ... although I don't like the idea of relying on X
namespace inheritance for a hard coded policy on setting the audit
container ID; we've worked hard to keep this independent of any
definition of a "container" and it would sadden me greatly if we had
to go back on that.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
