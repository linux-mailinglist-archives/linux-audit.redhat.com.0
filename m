Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F62D366C
	for <lists+linux-audit@lfdr.de>; Fri, 11 Oct 2019 02:41:20 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C1AD7155E0;
	Fri, 11 Oct 2019 00:41:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E2F419D70;
	Fri, 11 Oct 2019 00:41:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2CDA24E58A;
	Fri, 11 Oct 2019 00:41:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9B0fE8E029246 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 10 Oct 2019 20:41:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D0733100EBD6; Fri, 11 Oct 2019 00:41:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB764100EBA2
	for <linux-audit@redhat.com>; Fri, 11 Oct 2019 00:41:12 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8B0AA7E423
	for <linux-audit@redhat.com>; Fri, 11 Oct 2019 00:41:11 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id m7so8076399lji.2
	for <linux-audit@redhat.com>; Thu, 10 Oct 2019 17:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9wNy6JFK5djKAuZbuRMlDS+XyW8tF2WH1HB98CJhwX4=;
	b=Ebgr6hpepFByF0DkP5utDnq8dgpXwryts91lmQkxebHKHDitPBleV83coxn3yI9W2o
	4bjKmKWCPPjMPhL8Nq/Rdml5kvyzOdaMmxDE1iIeADKjQ4B3ePZan8TAafgqsmoQqDBo
	DPSQq0Dom4ILIzKaOPRAGB6iBjZKCOwLqRUsFj6Doy+Ihf3ofxWf6aVnflJ+uXxgpKYc
	bbkJw50tNvEfHUPIhBMY1Zh/pD7QtrHNUoMxcmVpT5dFWXFUE49Oh+2y3HcTvrkmCGKi
	d1cVCQqj7IfTxrHF88A0gj3Twf8bqPV2nRUrW6tYaMCpO+AnG3VtKUhbnJoR6lVbp5wI
	hqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9wNy6JFK5djKAuZbuRMlDS+XyW8tF2WH1HB98CJhwX4=;
	b=hko5KjXGyPgp/R3MgVwJ5W4GnhK7H07w8DluzgB1DD17yeDw6cs4t9d1nHClitnqA8
	yDc4FGSoqFVyY0icB7tMAXYHruFnNPTHU9a6ekighcMGfGx7VtgjvX1sBR9zheSc1WNU
	hyBnovgw153D2zHRapD0pVMGdbXzbJ3yO84Ey3d7qhJ1dBIDI6RAlegPuho6JY1NYlCg
	LkiUGDr/Id7GQYvPrmM1oQwGzPkjmkSIGdSlCztSbmZY/dW1ITaG9O4xpGkppcg+F1Fy
	n30W1Y4jeacFxcH6gy0ATDwQSA8HZE6Qy2qb0i4x9iRsRAbNMeY3AuwzZAZgm3SPEFDs
	54TA==
X-Gm-Message-State: APjAAAW5oGdOccoeK+mEdZs8qxejoWsClv+qeDY7DK9fv6QN/9RMtckW
	TW9uCIfU3nhtA9MUp0MfUE1cg+sqZwpQtUbC9v2r
X-Google-Smtp-Source: APXvYqyMEnp+g0nirg0RbsN817lbDmHEIQg2bqDza4Lalp8B5gyrzCzWjpLPJS7tANwgfZue3U1+820n9L5ACEXWqxU=
X-Received: by 2002:a2e:b17b:: with SMTP id a27mr7770213ljm.243.1570754469730; 
	Thu, 10 Oct 2019 17:41:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1568834524.git.rgb@redhat.com>
	<a6b00624ac746bc0df9dd0044311b8364374b25b.1568834525.git.rgb@redhat.com>
In-Reply-To: <a6b00624ac746bc0df9dd0044311b8364374b25b.1568834525.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 10 Oct 2019 20:40:58 -0400
Message-ID: <CAHC9VhT3QNHxXCc_QsC5K5HadAv7AqwNw-Fk+yLECquE_dKmfQ@mail.gmail.com>
Subject: Re: [PATCH ghak90 V7 18/21] audit: track container nesting
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 11 Oct 2019 00:41:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Fri, 11 Oct 2019 00:41:11 +0000 (UTC) for IP:'209.85.208.194'
	DOMAIN:'mail-lj1-f194.google.com'
	HELO:'mail-lj1-f194.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.194 mail-lj1-f194.google.com 209.85.208.194
	mail-lj1-f194.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Fri, 11 Oct 2019 00:41:19 +0000 (UTC)

On Wed, Sep 18, 2019 at 9:27 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> Track the parent container of a container to be able to filter and
> report nesting.
>
> Now that we have a way to track and check the parent container of a
> container, fixup other patches, or squash all nesting fixes together.
>
> fixup! audit: add container id
> fixup! audit: log drop of contid on exit of last task
> fixup! audit: log container info of syscalls
> fixup! audit: add containerid filtering
> fixup! audit: NETFILTER_PKT: record each container ID associated with a netNS
> fixup! audit: convert to contid list to check for orch/engine ownership softirq (for netfilter) audit: protect contid list lock from softirq
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  include/linux/audit.h |  1 +
>  kernel/audit.c        | 67 ++++++++++++++++++++++++++++++++++++++++++---------
>  kernel/audit.h        |  3 +++
>  kernel/auditfilter.c  | 20 ++++++++++++++-
>  kernel/auditsc.c      |  2 +-
>  5 files changed, 79 insertions(+), 14 deletions(-)

This is my last comment of the patchset because this is where it
starts to get a little weird.  I know we've talked about fixup!
patches some in the past, but perhaps I didn't do a very good job
communicating my poin; let me try again.

Submitting a fixup patch is okay if you've already posted a (lengthy)
patchset and there was a small nit that someone uncovered that needed
to be fixed prior to merging, assuming everyone (this includes the
reviewer, the patch author, and the maintainer) is okay with the
author posting the fix as fixup! patch then go for it.  Done this way,
fixup patches can save a lot of development, testing, and review time.
However, in my opinion it is wrong to submit a patchset that has fixup
patches as part of the original posting.  In this case fixup patches
have the opposite effect: the patchset becomes more complicated,
reviews take longer, and the likelihood of missing important details
increases.

When in doubt, don't submit separate fixup patches, fold them into the
original patches instead.

--
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
