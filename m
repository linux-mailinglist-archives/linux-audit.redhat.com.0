Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9B0141AAEBE
	for <lists+linux-audit@lfdr.de>; Wed, 15 Apr 2020 18:54:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586969653;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nCBEKJLUExGTb4gAbjUAQNN34dVMqbum+jbRePuauFo=;
	b=gLAxjMpo21PLLDM4YwjEMAZ075ttcIivRkleyhI+/DceaIM91dC399bl+w/m3/jDv5S8bc
	6GVnrFjafRDcPUsP3553l40Y/N9RxgvWt+WFcWLlCR6wyZkOh8iA2WGAZEOI4LKgtMDqMW
	q/1AhivZ9NvJ57QA6h/C73y5keTcd0M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-fAa3gwT0PRy4r0vmj7YPOQ-1; Wed, 15 Apr 2020 12:54:11 -0400
X-MC-Unique: fAa3gwT0PRy4r0vmj7YPOQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6392800D5B;
	Wed, 15 Apr 2020 16:54:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 848E7126513;
	Wed, 15 Apr 2020 16:54:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 71CDA18089CE;
	Wed, 15 Apr 2020 16:53:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03FGrn44017210 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 15 Apr 2020 12:53:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1FC581104E8C; Wed, 15 Apr 2020 16:53:49 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BBBD10054CB
	for <linux-audit@redhat.com>; Wed, 15 Apr 2020 16:53:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31AA3101A55E
	for <linux-audit@redhat.com>; Wed, 15 Apr 2020 16:53:47 +0000 (UTC)
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
	[209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-38-Og0FM8AiOFeqyVHbGnixmw-1; Wed, 15 Apr 2020 12:53:45 -0400
X-MC-Unique: Og0FM8AiOFeqyVHbGnixmw-1
Received: by mail-oi1-f197.google.com with SMTP id g198so13523311oib.1
	for <linux-audit@redhat.com>; Wed, 15 Apr 2020 09:53:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5OcF7TWn34i9EQblMYEKpClfav9C/6cS7BZfVRtY1ig=;
	b=nhK4nooJy18Y5cUsRxcr9jelq6XTALxpPUZlkgcjc5ZVnj6j6J/++85G5hu84eHpb/
	CHyTXL8SZnlrisyREGufEdAoeRfRqklAU6RRZY2QUlc4spQ/ZQq/NY6/UOqdeXiH2yLs
	kYHRQnu3QB/0CUmo+AtZ56IAja9H9SL0J41wwVjrIkjyWG8KAWLrGSXUMVWm7oNe6cHi
	6eaoaJvOLWYbQKtsvGK3Vjsb1gKpCLBAz7ZMxd08yYDrcQafMuZvpo22x2STziNQnnCv
	58AYW4JVRUZC0c5dAEAuplXu+ILrnigCbysZ2vGqzQhKXlyFh1aqxddTWWqrfTzi1kS/
	LGhw==
X-Gm-Message-State: AGi0PuYIwYS5Dmc+raOnV2ebaDUeKZHLjUXu7aP8wuhps+1uzlwxV0XC
	Avy3Z0hQdpu4XGk3gilmG2bmREuVUoQDBlyLX/GSGPGavGyNLuNRyTsJsdd4AQCelX0bIljchoh
	16nefIGmXtlEJw8FOlT/Q9hj5n7yiEKklrkk=
X-Received: by 2002:aca:b104:: with SMTP id a4mr98041oif.103.1586969623613;
	Wed, 15 Apr 2020 09:53:43 -0700 (PDT)
X-Google-Smtp-Source: APiQypLkvY6tKCCKHK+4XBaEZP1jLaOUmd+3Gz8TobGRm5I4yu2oGVOna4Zb5zyid5UxSIVu1Z9+oaZs2SxeDRP40G8=
X-Received: by 2002:aca:b104:: with SMTP id a4mr98019oif.103.1586969623350;
	Wed, 15 Apr 2020 09:53:43 -0700 (PDT)
MIME-Version: 1.0
References: <20191128153203.GA23803@workstation-kernel-dev>
	<20191130020742.GF157739@google.com>
	<20200415153417.svpbimg66vbeuk7u@madcap2.tricolour.ca>
	<CAHC9VhTdfkxdiEwCZu-JCQGxJ_DNr0b_Ukm40VEUxq=Lc-zx1g@mail.gmail.com>
	<20200415161503.umujm6v4gadmf6qm@madcap2.tricolour.ca>
In-Reply-To: <20200415161503.umujm6v4gadmf6qm@madcap2.tricolour.ca>
From: Ondrej Mosnacek <omosnace@redhat.com>
Date: Wed, 15 Apr 2020 18:53:32 +0200
Message-ID: <CAFqZXNuYnvru+pMhPwNTBn1+uB=MfYh1yWWBeAn+J-=LXrFgcg@mail.gmail.com>
Subject: Re: [PATCH v2] kernel: audit.c: Add __rcu notation to RCU pointer
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03FGrn44017210
X-loop: linux-audit@redhat.com
Cc: Amol Grover <frextrite@gmail.com>,
	Linux kernel mailing list <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	linux-kernel-mentees@lists.linuxfoundation.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 15, 2020 at 6:15 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-04-15 12:06, Paul Moore wrote:
> > On Wed, Apr 15, 2020 at 11:34 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > On 2019-11-29 21:07, Joel Fernandes wrote:
> > > > On Thu, Nov 28, 2019 at 09:02:03PM +0530, Amol Grover wrote:
> > > > > add __rcu notation to RCU protected global pointer auditd_conn
> > > >
> > > > Again, please use proper punctuation and captilization. This is unacceptable.
> > > > Please put more effort into changelog.
> > > >
> > > > Otherwise the patch diff itself looks good to me, with the above nit
> > > > corrected, you could add my tag to the next revision:
> > > >
> > > > Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > >
> > > > thanks,
> > > >
> > > >  - Joel
> > > >
> > > > >
> > > > > Fixes multiple instances of sparse error:
> > > > > error: incompatible types in comparison expression
> > > > > (different address spaces)
> > >
> > > Amol or Joel: Is there a reproducer recipe for this?
> >
> > The commit which was merged has a slightly better description which may help.
>
> I've already seen this.  Perhaps I should have replied to this message
> instead to make that evident.  What really needed was Amol's original
> message sent to this list, but it was Joel who included this list in his
> reply (all 3 versions).
>
> I'm looking for the specific setup and commands that produced this error.

You can run make with "C=1", which will run sparse on all files that
are rebuilt during that make run. For example, if I fully build the
kernel and then revert commit
cb5172d96d16df72db8b55146b0ec00bfd97f079, I get:

$ make [...] C=1
[...]
  CHECK   [...]/kernel/audit.c
[...]/kernel/audit.c:218:14: error: incompatible types in comparison
expression (different address spaces):
[...]/kernel/audit.c:218:14:    struct auditd_connection [noderef] <asn:4> *
[...]/kernel/audit.c:218:14:    struct auditd_connection *
(...and a lot more errors like this + 2 different warnings)

And when I un-revert it again, I get only the 2 warnings.

-- 
Ondrej Mosnacek <omosnace at redhat dot com>
Software Engineer, Security Technologies
Red Hat, Inc.


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

