Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id BF86B1E8A6F
	for <lists+linux-audit@lfdr.de>; Fri, 29 May 2020 23:50:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590789002;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7TP2Y92H6yoVJzJi9ehIDGAVr1+IeIADEJwDoH3R5y8=;
	b=CjDPw9etY+NzgKwD2zu1ZvxaINdU2/nSy31UpYU1HKiGyUuPOuwuLf01+wxZklTWsn/Jcm
	/2qHl4N8V7p3pJabBm6gVtH/7ag8zKMLsGQ4YxArqXeHnFpnpBVV+rJ1aGaxxvFNyyZV56
	M34qONJw/WA3ZZN6Bu5uBe7gvs0O/uA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-e4k1Ae1gPTmCibm1y8uGtw-1; Fri, 29 May 2020 17:49:43 -0400
X-MC-Unique: e4k1Ae1gPTmCibm1y8uGtw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62A4CA0BD8;
	Fri, 29 May 2020 21:49:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE4AB5D9D7;
	Fri, 29 May 2020 21:49:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A75F51809543;
	Fri, 29 May 2020 21:49:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04TLnVo9023446 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 29 May 2020 17:49:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9796A2166BA4; Fri, 29 May 2020 21:49:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 897862156A2E
	for <linux-audit@redhat.com>; Fri, 29 May 2020 21:49:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BEF63186E3A4
	for <linux-audit@redhat.com>; Fri, 29 May 2020 21:49:27 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-240-y5B-m_fYN9--azP5rzH6FA-1; Fri, 29 May 2020 17:49:25 -0400
X-MC-Unique: y5B-m_fYN9--azP5rzH6FA-1
Received: by mail-ed1-f53.google.com with SMTP id i16so2866928edv.1
	for <linux-audit@redhat.com>; Fri, 29 May 2020 14:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=i3Yay3J4C91zRXmaZCuJHDbK5+4joJmdZvjst30DY3Q=;
	b=TC2zerzNgx1r4MJcMDW/H8UcY1DJNzAzNnyYycJ7J72qZPCFdsGzjOpNM6s6+WktUL
	8/AuBracfBQJ0074OGGp4gYscoJ+X38EEroNKlWl066l9eJO+vfPeIMWTCC+S+2G4uD0
	M9V4Uybs3gjMBFRjziqjKzJ3wqZ+CGS2FLFfkzaluaxgVptdllGlYXhLPgmUz1Jg5Wxb
	HhTVudCETEBnxIfw2euE0YwX2Df+EtK/N0/S2PMP3PSouOXY42zwMr3F8xpm6xkNVdvw
	dApJSsADeyJreVksqF+i3GyY0F8ZfOXFaJmXWlkmZ0M5dU640xUmV1Xerg8zZZ4NJ4v5
	63gA==
X-Gm-Message-State: AOAM532byqE8PS0f3ZV7iUrxLZzIoNJcmi3XkotScfcHTYbg/iT3YmI3
	lVnvYoOsMcp3ss8fJbKOMSx0XhfIaPU7PsvXdPSs
X-Google-Smtp-Source: ABdhPJzcch2ANB+vGwz7/ypSyXMWid6DxcWwHjb0+PrOoT1cC34XND7hUzBTgDvkDgeo687O1moJrzwH5iipCjCwk6k=
X-Received: by 2002:aa7:cb8d:: with SMTP id r13mr10297945edt.12.1590788963696; 
	Fri, 29 May 2020 14:49:23 -0700 (PDT)
MIME-Version: 1.0
References: <45ce3357-ca82-8721-22d6-dabe751ad8fa.ref@schaufler-ca.com>
	<45ce3357-ca82-8721-22d6-dabe751ad8fa@schaufler-ca.com>
	<CAHC9VhQL9Q=b75o3Y6o4VvQb97tgkhqbJ4z3zQUBm6wsWvUF9A@mail.gmail.com>
	<29258822-14bb-5ef9-eec9-e5d09f22d70f@schaufler-ca.com>
In-Reply-To: <29258822-14bb-5ef9-eec9-e5d09f22d70f@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 29 May 2020 17:49:12 -0400
Message-ID: <CAHC9VhTF-Y+YW50Qo-UgOFPuvGPvHxPph-KHfU7CmsRbD7QW1A@mail.gmail.com>
Subject: Re: The audit "context" and when to expect it.
To: Casey Schaufler <casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>,
	Linux-Audit Mailing List <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 29, 2020 at 5:42 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> On 5/29/2020 12:01 PM, Paul Moore wrote:
> > On Fri, May 29, 2020 at 1:59 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> >> What does a NULL audit context (e.g. ab->cxt == NULL) tell
> >> me about the status of the audit buffer? It seems like it should
> >> be telling me that the audit buffer is being created for some
> >> purpose unrelated to the current task. And yet there are places
> >> where information is pulled from the current task even when
> >> the cxt is NULL.
> > The simple answer is that a NULL audit_context indicates a standalone
> > record, meaning a record with a unique timestamp so that it is not
> > associated with any other records into an event.  If the audit_context
> > it not NULL then the information in the context is used to group, or
> > associate, all of the records sharing that context into a single
> > event.
>
> OK, so if I want a add a sub-record with the multiple secctx values

Terminology nit-pick: there are "records" and "events", there is
nothing we would call a sub-record.  In the case you are referring to,
this is a record which would always be part of a larger collection of
records.  It's similar to a PATH record in that it doesn't make sense
by itself, but when combined with the other records in an event, it
provides useful information.

> for the events that include a subject value I need to change those
> events to use an audit_context. Is that going to introduce an
> unacceptable memory or performance burden?

No more so than any additional record.  Or rather, it seems like this
is the only way to do what you want to do so I don't see a way around
it.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

