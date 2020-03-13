Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4683C184C84
	for <lists+linux-audit@lfdr.de>; Fri, 13 Mar 2020 17:30:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584117007;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=c585ZtMkMp58bZLpkgypyYzgEWQXRxvvCoUeH9U4GuE=;
	b=UNxYoI7RcIjbOSt64vnMRj6YaMx98CGHnLZY3RS9f/lukclyb+GfZeZJgNpQ9tQeLeJNR5
	FQxKZ2IVLW3nrGMjQGPO2b2f3mEZw2ubNnqpcH5lj/83glbOV608gdxyI2lLYn8nvYrQiO
	j2Y6LH+aHt6CNBrqVZ5rVGoIanOfcO4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-aR4Ntw5DMyqeOTmkje21eQ-1; Fri, 13 Mar 2020 12:30:05 -0400
X-MC-Unique: aR4Ntw5DMyqeOTmkje21eQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96117802561;
	Fri, 13 Mar 2020 16:29:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 194065C1BB;
	Fri, 13 Mar 2020 16:29:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 36DCA18095FF;
	Fri, 13 Mar 2020 16:29:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02DGTUFX010937 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 13 Mar 2020 12:29:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DBED22166B31; Fri, 13 Mar 2020 16:29:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D6EB22166B30
	for <linux-audit@redhat.com>; Fri, 13 Mar 2020 16:29:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 986C680066D
	for <linux-audit@redhat.com>; Fri, 13 Mar 2020 16:29:28 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-477-axXF7on_MzGX5ZllpvsKVw-1; Fri, 13 Mar 2020 12:29:23 -0400
X-MC-Unique: axXF7on_MzGX5ZllpvsKVw-1
Received: by mail-ed1-f66.google.com with SMTP id df19so6402114edb.6
	for <linux-audit@redhat.com>; Fri, 13 Mar 2020 09:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KQ+pObvU67uvaK3l1r4Ceb5YYAtUXZc7zlplXO9TGzk=;
	b=cWXGJaVcpadu7DMXJmjArcPzP74/5TrPk/5iggg2evyTtAWXTHx3OZiFH4AAB8rdah
	7dY1abrdjrVD40QTBqGDzT1V+4ZC73XWkKOpSJ0vFfzcsD/pODCfn8lyzUvMh/EuLEEd
	8//MjMcxsUbxFDRQgS+L5HApQu/Z8EaUYtvyFd8uUR2DaYl0zA5uG5xn+o4mm93rsidr
	iiHEbnKJP0Qzi8jeL+QIaRHi3QUu43FkDnwGKZ3Y1RSGAH3E35wnbbJaLhdPqVjfYkPq
	tDyJdYOH5bmwgkiJ3LGmFrjY5EyTTasYwrNgpifXTlMTpCGpva9ZA+aR8jui+JpQu40G
	Jfuw==
X-Gm-Message-State: ANhLgQ1XatCN5v7/zKl9SdBn5q2w+Rv5GdXn829RnPF3+87FYOCVF0xi
	xyxAzuCV4g+s913xleii22LPK5EBh1Ve/yqxnWnx
X-Google-Smtp-Source: ADFU+vuL+b7H+tHmfIL9uEWtaqijyChHCYny1ByjHCCYsp9IHY7VBWU/eiFjWL7wPzp8K/OQLrQaC/SDlvMtNAtsA5M=
X-Received: by 2002:a17:907:105a:: with SMTP id
	oy26mr3891035ejb.308.1584116962089; 
	Fri, 13 Mar 2020 09:29:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1577736799.git.rgb@redhat.com>
	<20200204231454.oxa7pyvuxbj466fj@madcap2.tricolour.ca>
	<CAHC9VhQquokw+7UOU=G0SsD35UdgmfysVKCGCE87JVaoTkbisg@mail.gmail.com>
	<3142237.YMNxv0uec1@x2>
	<CAHC9VhTiCHQbp2SwK0Xb1QgpUZxOQ26JKKPsVGT0ZvMqx28oPQ@mail.gmail.com>
	<CAHC9VhS09b_fM19tn7pHZzxfyxcHnK+PJx80Z9Z1hn8-==4oLA@mail.gmail.com>
	<20200312193037.2tb5f53yeisfq4ta@madcap2.tricolour.ca>
In-Reply-To: <20200312193037.2tb5f53yeisfq4ta@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 13 Mar 2020 12:29:10 -0400
Message-ID: <CAHC9VhQoVOzy_b9W6h+kmizKr1rPkC4cy5aYoKT2i0ZgsceNDg@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 07/16] audit: add contid support for signalling
	the audit daemon
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02DGTUFX010937
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

On Thu, Mar 12, 2020 at 3:30 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-02-13 16:44, Paul Moore wrote:
> > This is a bit of a thread-hijack, and for that I apologize, but
> > another thought crossed my mind while thinking about this issue
> > further ... Once we support multiple auditd instances, including the
> > necessary record routing and duplication/multiple-sends (the host
> > always sees *everything*), we will likely need to find a way to "trim"
> > the audit container ID (ACID) lists we send in the records.  The
> > auditd instance running on the host/initns will always see everything,
> > so it will want the full container ACID list; however an auditd
> > instance running inside a container really should only see the ACIDs
> > of any child containers.
>
> Agreed.  This should be easy to check and limit, preventing an auditd
> from seeing any contid that is a parent of its own contid.
>
> > For example, imagine a system where the host has containers 1 and 2,
> > each running an auditd instance.  Inside container 1 there are
> > containers A and B.  Inside container 2 there are containers Y and Z.
> > If an audit event is generated in container Z, I would expect the
> > host's auditd to see a ACID list of "1,Z" but container 1's auditd
> > should only see an ACID list of "Z".  The auditd running in container
> > 2 should not see the record at all (that will be relatively
> > straightforward).  Does that make sense?  Do we have the record
> > formats properly designed to handle this without too much problem (I'm
> > not entirely sure we do)?
>
> I completely agree and I believe we have record formats that are able to
> handle this already.

I'm not convinced we do.  What about the cases where we have a field
with a list of audit container IDs?  How do we handle that?

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

