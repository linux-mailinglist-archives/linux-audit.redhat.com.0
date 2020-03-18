Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id DE11318A4D4
	for <lists+linux-audit@lfdr.de>; Wed, 18 Mar 2020 21:57:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584565057;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RqlYhTteM4b+m50K5rjyZvbPYuPSJJuxUI+dda7Tg/8=;
	b=TOellEWdz2LYc1YYLspWASBz3YTQpr+vJcHCW7gSkXW0TPCXr3CMTxbpQKFTPdrUImZ1cY
	Ingze4G029+E3oz9LnddxJW0ZU03HDXzjrl1lK1BmY1Mdab/lCdfHdzRkcIzEA/Pu7ShUF
	UGLuYwD1MTo5AWmfGYDRQMBU02JDfbg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-s7OOVGhLMzW0Aj_5NGgs1Q-1; Wed, 18 Mar 2020 16:57:34 -0400
X-MC-Unique: s7OOVGhLMzW0Aj_5NGgs1Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD3ED13EA;
	Wed, 18 Mar 2020 20:57:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 047C5BBBC1;
	Wed, 18 Mar 2020 20:57:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1E46C87011;
	Wed, 18 Mar 2020 20:57:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02IKv5nY005851 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 18 Mar 2020 16:57:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6E7542166B28; Wed, 18 Mar 2020 20:57:05 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 691FD2166AE4
	for <linux-audit@redhat.com>; Wed, 18 Mar 2020 20:57:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B402C8CC924
	for <linux-audit@redhat.com>; Wed, 18 Mar 2020 20:57:02 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-459-g8DHZ7b8OFmmYXhiMFL0TQ-1; Wed, 18 Mar 2020 16:56:59 -0400
X-MC-Unique: g8DHZ7b8OFmmYXhiMFL0TQ-1
Received: by mail-ed1-f68.google.com with SMTP id a43so10825424edf.6
	for <linux-audit@redhat.com>; Wed, 18 Mar 2020 13:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=g4AW1divsHMPr3pCP4CdP4Cl7K8Ooaeq6pBA6GUaETQ=;
	b=GZtVzHkrMbKEaWbuzBKOdvWCd2QGBPVRzC4kIn02e8ymTfVvIa/LyRc51TuuAic2za
	C+pLFzsR7gz6IsVU3jgUTfS96qRCZajnkilOKTZ+hY7LsR6Je/w2X1k1H4pr6J+FSZhw
	hYIDkg0iS/xszZxUqZNOIR1XvRFNOrnuyYqNCWt61uKO817NvCw68W6Ms9oMO+pRugKt
	zIR8Je7ORBwmWbk53Rk2i6iFQOA23aANsdD7kBuzwfTeu+xBmcbwKgfbmzJz1v+KnGrf
	8yTFW4NXnhQTGHYy6IQhtLkuZThQnaBgVXdzvknwKdcGeF3qVUA/b+YAy67UqKn5X0Ex
	9UEA==
X-Gm-Message-State: ANhLgQ0IKinmt2CA2eSxA80YGSk/gTEfsyxoq/YpF0lK66nVAwZOFTDV
	LE/jqLBno22Xul+6j4aDLXtXegh2peP54JRaU5dm
X-Google-Smtp-Source: ADFU+vufKN/Y6D0NZVHBfHqWGsUn/HVoc7DCLKs6yGElrUkdM/dJMEcsEF5RKrrMdJTSmw7tnsN+cSFDtag+WxqrPu4=
X-Received: by 2002:a17:906:7b8d:: with SMTP id
	s13mr120333ejo.77.1584565017755; 
	Wed, 18 Mar 2020 13:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1577736799.git.rgb@redhat.com>
	<20200204231454.oxa7pyvuxbj466fj@madcap2.tricolour.ca>
	<CAHC9VhQquokw+7UOU=G0SsD35UdgmfysVKCGCE87JVaoTkbisg@mail.gmail.com>
	<3142237.YMNxv0uec1@x2>
	<CAHC9VhTiCHQbp2SwK0Xb1QgpUZxOQ26JKKPsVGT0ZvMqx28oPQ@mail.gmail.com>
	<CAHC9VhS09b_fM19tn7pHZzxfyxcHnK+PJx80Z9Z1hn8-==4oLA@mail.gmail.com>
	<20200312193037.2tb5f53yeisfq4ta@madcap2.tricolour.ca>
	<CAHC9VhQoVOzy_b9W6h+kmizKr1rPkC4cy5aYoKT2i0ZgsceNDg@mail.gmail.com>
	<20200313185900.y44yvrfm4zxa5lfk@madcap2.tricolour.ca>
In-Reply-To: <20200313185900.y44yvrfm4zxa5lfk@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 18 Mar 2020 16:56:46 -0400
Message-ID: <CAHC9VhR2zCCE5bjH75rSwfLC7TJGFj4RBnrtcOoUiqVp9q5TaA@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 07/16] audit: add contid support for signalling
	the audit daemon
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02IKv5nY005851
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 13, 2020 at 2:59 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-03-13 12:29, Paul Moore wrote:
> > On Thu, Mar 12, 2020 at 3:30 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > On 2020-02-13 16:44, Paul Moore wrote:
> > > > This is a bit of a thread-hijack, and for that I apologize, but
> > > > another thought crossed my mind while thinking about this issue
> > > > further ... Once we support multiple auditd instances, including the
> > > > necessary record routing and duplication/multiple-sends (the host
> > > > always sees *everything*), we will likely need to find a way to "trim"
> > > > the audit container ID (ACID) lists we send in the records.  The
> > > > auditd instance running on the host/initns will always see everything,
> > > > so it will want the full container ACID list; however an auditd
> > > > instance running inside a container really should only see the ACIDs
> > > > of any child containers.
> > >
> > > Agreed.  This should be easy to check and limit, preventing an auditd
> > > from seeing any contid that is a parent of its own contid.
> > >
> > > > For example, imagine a system where the host has containers 1 and 2,
> > > > each running an auditd instance.  Inside container 1 there are
> > > > containers A and B.  Inside container 2 there are containers Y and Z.
> > > > If an audit event is generated in container Z, I would expect the
> > > > host's auditd to see a ACID list of "1,Z" but container 1's auditd
> > > > should only see an ACID list of "Z".  The auditd running in container
> > > > 2 should not see the record at all (that will be relatively
> > > > straightforward).  Does that make sense?  Do we have the record
> > > > formats properly designed to handle this without too much problem (I'm
> > > > not entirely sure we do)?
> > >
> > > I completely agree and I believe we have record formats that are able to
> > > handle this already.
> >
> > I'm not convinced we do.  What about the cases where we have a field
> > with a list of audit container IDs?  How do we handle that?
>
> I don't understand the problem.  (I think you crossed your 1/2 vs
> A/B/Y/Z in your example.) ...

It looks like I did, sorry about that.

> ... Clarifying the example above, if as you
> suggest an event happens in container Z, the hosts's auditd would report
>         Z,^2
> and the auditd in container 2 would report
>         Z,^2
> but if there were another auditd running in container Z it would report
>         Z
> while the auditd in container 1 or A/B would see nothing.

Yes.  My concern is how do we handle this to minimize duplicating and
rewriting the records?  It isn't so much about the format, although
the format is a side effect.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

