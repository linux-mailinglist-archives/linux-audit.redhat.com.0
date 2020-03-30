Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id E714D197E58
	for <lists+linux-audit@lfdr.de>; Mon, 30 Mar 2020 16:27:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585578436;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WKdUdipO5vi+ofl2CREd7E901qNZKol14WcFxxOTGEY=;
	b=dSkOUtGwP59vovHZkHmNnsZ/p8DXrEg6Htu8js9yGc2lNYMbNsvev7TrkWYQnxdQJpNMMz
	cHHGADEkC3meEw9lweMDzrKPATzutk/F/daxU9OGZ4syk66DD6bix/QLcSyknWdMK5W7YS
	QJsBt1HghLQQHvtadX5aZKH2f2IQ3I4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-HrEdTW5hMBe8had89Dobgg-1; Mon, 30 Mar 2020 10:27:11 -0400
X-MC-Unique: HrEdTW5hMBe8had89Dobgg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E7B919057A1;
	Mon, 30 Mar 2020 14:27:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9072D19488;
	Mon, 30 Mar 2020 14:27:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B47D618089CE;
	Mon, 30 Mar 2020 14:26:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02UEQoj4023070 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 10:26:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6883C10E60F7; Mon, 30 Mar 2020 14:26:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6427010E60F6
	for <linux-audit@redhat.com>; Mon, 30 Mar 2020 14:26:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D4E68EC75C
	for <linux-audit@redhat.com>; Mon, 30 Mar 2020 14:26:48 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-246-kTdeSxoPP8iZKg1JQQcH1g-1; Mon, 30 Mar 2020 10:26:45 -0400
X-MC-Unique: kTdeSxoPP8iZKg1JQQcH1g-1
Received: by mail-ed1-f65.google.com with SMTP id de14so20816629edb.4
	for <linux-audit@redhat.com>; Mon, 30 Mar 2020 07:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nIwHXYaHc6+JACA+fBj9Ng03i5CGrWKmbD2K5DI9CIE=;
	b=pnUHmHL7b63wc3xLy4EZeIVXgRlulgwfR+g9IDVdnwRaLu8Xkq9v2jhS6Feznb7T4X
	8MKbf4OQtLxbSpqux/G85/3Y/UcRykY69XWAVnx0gvpe6U5aWFs49WS/lHNBRWUSmr5W
	3LY7WqCqzXW2WLAxlsa3nxmue1vg/7AczwOUd/sfnidPmUcTYiQJS2udi1MHoMHP0Ael
	GNcGoy8jLgbGqssFspr4BUz8g0hwrQ5nS1yAEAdg6dfEqvhnu0742I33/pVOAAIdGmib
	Xml6R0SFmAMiOKHo4I71YcaQcQAm++U8EXBfjndqvkFibv3C8kyza/K0LOVQDcW/hOrr
	MHXA==
X-Gm-Message-State: ANhLgQ3gq6uKy3dIUUhw1nGNBuksaC5+etXvMOOSzm+Yf083xtty81x+
	Y6+qcSylhYNMlI0bsK1buZ/TuSYK1wx/U6XMfOxg
X-Google-Smtp-Source: ADFU+vvlCnwKHdKl+nxVyk3rZYlrc9sBCQh+XYbClaJVIEpd7a51sng79ner8qjsey4+ghjyaCmOteBvcjGEv+YeeMA=
X-Received: by 2002:aa7:c48f:: with SMTP id m15mr9786550edq.164.1585578403828; 
	Mon, 30 Mar 2020 07:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200313185900.y44yvrfm4zxa5lfk@madcap2.tricolour.ca>
	<CAHC9VhR2zCCE5bjH75rSwfLC7TJGFj4RBnrtcOoUiqVp9q5TaA@mail.gmail.com>
	<20200318212630.mw2geg4ykhnbtr3k@madcap2.tricolour.ca>
	<CAHC9VhRYvGAru3aOMwWKCCWDktS+2pGr+=vV4SjHW_0yewD98A@mail.gmail.com>
	<20200318215550.es4stkjwnefrfen2@madcap2.tricolour.ca>
	<CAHC9VhSdDDP7Ec-w61NhGxZG5ZiekmrBCAg=Y=VJvEZcgQh46g@mail.gmail.com>
	<20200319220249.jyr6xmwvflya5mks@madcap2.tricolour.ca>
	<CAHC9VhR84aN72yNB_j61zZgrQV1y6yvrBLNY7jp7BqQiEDL+cw@mail.gmail.com>
	<20200324210152.5uydf3zqi3dwshfu@madcap2.tricolour.ca>
	<CAHC9VhTQUnVhoN3JXTAQ7ti+nNLfGNVXhT6D-GYJRSpJHCwDRg@mail.gmail.com>
	<20200330134705.jlrkoiqpgjh3rvoh@madcap2.tricolour.ca>
In-Reply-To: <20200330134705.jlrkoiqpgjh3rvoh@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 30 Mar 2020 10:26:34 -0400
Message-ID: <CAHC9VhQTsEMcYAF1CSHrrVn07DR450W9j6sFVfKAQZ0VpheOfw@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 07/16] audit: add contid support for signalling
	the audit daemon
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02UEQoj4023070
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 30, 2020 at 9:47 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-03-28 23:11, Paul Moore wrote:
> > On Tue, Mar 24, 2020 at 5:02 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > On 2020-03-23 20:16, Paul Moore wrote:
> > > > On Thu, Mar 19, 2020 at 6:03 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > > > On 2020-03-18 18:06, Paul Moore wrote:
> > > >
> > > > ...
> > > >
> > > > > > I hope we can do better than string manipulations in the kernel.  I'd
> > > > > > much rather defer generating the ACID list (if possible), than
> > > > > > generating a list only to keep copying and editing it as the record is
> > > > > > sent.
> > > > >
> > > > > At the moment we are stuck with a string-only format.
> > > >
> > > > Yes, we are.  That is another topic, and another set of changes I've
> > > > been deferring so as to not disrupt the audit container ID work.
> > > >
> > > > I was thinking of what we do inside the kernel between when the record
> > > > triggering event happens and when we actually emit the record to
> > > > userspace.  Perhaps we collect the ACID information while the event is
> > > > occurring, but we defer generating the record until later when we have
> > > > a better understanding of what should be included in the ACID list.
> > > > It is somewhat similar (but obviously different) to what we do for
> > > > PATH records (we collect the pathname info when the path is being
> > > > resolved).
> > >
> > > Ok, now I understand your concern.
> > >
> > > In the case of NETFILTER_PKT records, the CONTAINER_ID record is the
> > > only other possible record and they are generated at the same time with
> > > a local context.
> > >
> > > In the case of any event involving a syscall, that CONTAINER_ID record
> > > is generated at the time of the rest of the event record generation at
> > > syscall exit.
> > >
> > > The others are only generated when needed, such as the sig2 reply.
> > >
> > > We generally just store the contobj pointer until we actually generate
> > > the CONTAINER_ID (or CONTAINER_OP) record.
> >
> > Perhaps I'm remembering your latest spin of these patches incorrectly,
> > but there is still a big gap between when the record is generated and
> > when it is sent up to the audit daemon.  Most importantly in that gap
> > is the whole big queue/multicast/unicast mess.
>
> So you suggest generating that record on the fly once it reaches the end
> of the audit_queue just before being sent?  That sounds...  disruptive.
> Each audit daemon is going to have its own queues, so by the time it
> ends up in a particular queue, we'll already know its scope and would
> have the right list of contids to print in that record.

I'm not suggesting any particular solution, I'm just pointing out a
potential problem.  It isn't clear to me that you've thought about how
we generate a multiple records, each with the correct ACID list
intended for a specific audit daemon, based on a single audit event.
Explain to me how you intend that to work and we are good.  Be
specific because I'm not convinced we are talking on the same plane
here.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

