Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D636D6AE
	for <lists+linux-audit@lfdr.de>; Thu, 18 Jul 2019 23:53:41 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AFA4B88319;
	Thu, 18 Jul 2019 21:53:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 44B6E6012C;
	Thu, 18 Jul 2019 21:53:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A98631800206;
	Thu, 18 Jul 2019 21:53:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6ILrF2Y029323 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 18 Jul 2019 17:53:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4D480607C8; Thu, 18 Jul 2019 21:53:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4877D607C7
	for <linux-audit@redhat.com>; Thu, 18 Jul 2019 21:53:13 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AE7EE30A7C6D
	for <linux-audit@redhat.com>; Thu, 18 Jul 2019 21:53:11 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id b29so13052406lfq.1
	for <linux-audit@redhat.com>; Thu, 18 Jul 2019 14:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RhzTrt+KngzjicFbTv3vZ6r7DsUfT24hW3ZTH7kCo04=;
	b=BDDC63AbbksIGaPLCaZ+G2vZ+QlUC0Y4xmaYnnx1w9Sn0c/YSKCOyE3F3bipx/OPNo
	bY+GCUelVN9YgKRNdiGTQc7e9dxHE8srVeTFP4z3kHDTgyTHdIJxEgeYAGwEg5uRlCR4
	SJCBe/KsTQXTy1ZbjaHtMM7hkizkZLcw0c9zfxcr0RvysIbU+uTnupNfETlIA5tdojdb
	eaHLpJsvTbxt6FmfE6Rqf0hRmvzcJp0R71+FTYwBZjMbwYRjqxFe4jlSYdDpAlcz6a+v
	gHInJ6oZUdBaKuk2fyjd8yd5aDlkZ2MjSHc//o4Z3Oextu3SQoPtQvrnS0hkfu0OOV0b
	pBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RhzTrt+KngzjicFbTv3vZ6r7DsUfT24hW3ZTH7kCo04=;
	b=YosI/kYlRbDVIx49rP8kZNt4f6zMBWXHF62Ndhb0Xe5fX2ZZE4wHPpVx3O6zk0JalX
	+QSgVUcQhJWfV/f1A39w2Fd4PQPhenFM3KrAUcbisKPhPPNNOBsmByOywRuQwbtUj8ng
	6a+53p4ZIckQpLIT0lGO5q6zF4yW9VSKLWcR+asdwUyPCYmIdo2F6uI7LKo9HWo3CN0P
	Ri7/AXweICj+5HeuH+wpWhzwz2+oWqbPrhmkjRjTogwB7OkZsBbYwqN5cwN8agbK+HQr
	eRrfXokTjO3QlufCY1KuC/zr8IURdYskQ5n9UXwhIa6pp8q6q0zC7XizSP43XfqHPdCp
	gxng==
X-Gm-Message-State: APjAAAUB7ZqtWLhlk+P7xs4oIjEIsopuI+i/sX/HKbFZFxQqy99ej3DF
	LXBxVxUHQ5yogIDWlzYjvdUx8iscrXfMTGuTY9q+
X-Google-Smtp-Source: APXvYqyGCCJtInWCDaYi60JZY3NOkc1TuPq3hehijvo4gTpiQWjSYxIYBAQx3HMzGAWPk3gWvXKxriSLAdaQ7algVzQ=
X-Received: by 2002:a19:8093:: with SMTP id
	b141mr22767615lfd.137.1563486789899; 
	Thu, 18 Jul 2019 14:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190529153427.GB8959@cisco>
	<CAHC9VhSF3AjErX37+eeusJ7+XRw8yuPsmqBTRwc9EVoRBh_3Tw@mail.gmail.com>
	<20190529222835.GD8959@cisco>
	<CAHC9VhRS66VGtug3fq3RTGHDvfGmBJG6yRJ+iMxm3cxnNF-zJw@mail.gmail.com>
	<20190530170913.GA16722@mail.hallyn.com>
	<CAHC9VhThLiQzGYRUWmSuVfOC6QCDmA75BDB7Eg7V8HX4x7ymQg@mail.gmail.com>
	<20190708180558.5bar6ripag3sdadl@madcap2.tricolour.ca>
	<CAHC9VhRTT7JWqNnynvK04wKerjc-3UJ6R1uPtjCAPVr_tW-7MA@mail.gmail.com>
	<20190716220320.sotbfqplgdructg7@madcap2.tricolour.ca>
	<CAHC9VhScHizB2r5q3T5s0P3jkYdvzBPPudDksosYFp_TO7W9-Q@mail.gmail.com>
	<20190718005145.eshekqfr3navqqiy@madcap2.tricolour.ca>
In-Reply-To: <20190718005145.eshekqfr3navqqiy@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 18 Jul 2019 17:52:58 -0400
Message-ID: <CAHC9VhTYV02ws3QcezER5cY+Xt+tExcJEO-dumTDx=FXGFh3nw@mail.gmail.com>
Subject: Re: [PATCH ghak90 V6 02/10] audit: add container id
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Thu, 18 Jul 2019 21:53:12 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Thu, 18 Jul 2019 21:53:12 +0000 (UTC) for IP:'209.85.167.67'
	DOMAIN:'mail-lf1-f67.google.com' HELO:'mail-lf1-f67.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.67 mail-lf1-f67.google.com 209.85.167.67
	mail-lf1-f67.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Thu, 18 Jul 2019 21:53:40 +0000 (UTC)

On Wed, Jul 17, 2019 at 8:52 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2019-07-16 19:30, Paul Moore wrote:

...

> > We can trust capable(CAP_AUDIT_CONTROL) for enforcing audit container
> > ID policy, we can not trust ns_capable(CAP_AUDIT_CONTROL).
>
> Ok.  So does a process in a non-init user namespace have two (or more)
> sets of capabilities stored in creds, one in the init_user_ns, and one
> in current_user_ns?  Or does it get stripped of all its capabilities in
> init_user_ns once it has its own set in current_user_ns?  If the former,
> then we can use capable().  If the latter, we need another mechanism, as
> you have suggested might be needed.

Unfortunately I think the problem is that ultimately we need to allow
any container orchestrator that has been given privileges to manage
the audit container ID to also grant that privilege to any of the
child process/containers it manages.  I don't believe we can do that
with capabilities based on the code I've looked at, and the
discussions I've had, but if you find a way I would leave to hear it.

> If some random unprivileged user wants to fire up a container
> orchestrator/engine in his own user namespace, then audit needs to be
> namespaced.  Can we safely discard this scenario for now?

I think the only time we want to allow a container orchestrator to
manage the audit container ID is if it has been granted that privilege
by someone who has that privilege already.  In the zero-container, or
single-level of containers, case this is relatively easy, and we can
accomplish it using CAP_AUDIT_CONTROL as the privilege.  If we start
nesting container orchestrators it becomes more complicated as we need
to be able to support granting and inheriting this privilege in a
manner; this is why I suggested a new mechanism *may* be necessary.

--
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
