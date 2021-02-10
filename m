Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 07DDF3170E4
	for <lists+linux-audit@lfdr.de>; Wed, 10 Feb 2021 21:06:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612987613;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lkaTaAj03ETKmuEpK6KDM27manhdpYrWAYUXcQZ/zoU=;
	b=E2oSxeyjIzyjCWbHbdHu5G6fxvcn7xM82YY/x7g1OVoNp02jUJnFG/Pf9eHqlHNkjpxoKG
	6+a0vCSVdVRNGGivzR35iH0m3sEgqEY0+o5lUNtZfAXU90NrsT3YqTPRCo12MRLJq3lcOD
	DK7EY3BHhPSEQRBHDwFbSdH8CkuI5zQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-ReNO6AwdNIazrQ6TV6-VvA-1; Wed, 10 Feb 2021 15:06:50 -0500
X-MC-Unique: ReNO6AwdNIazrQ6TV6-VvA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 570711020C22;
	Wed, 10 Feb 2021 20:06:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79AC360CCC;
	Wed, 10 Feb 2021 20:06:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 19FC418095C9;
	Wed, 10 Feb 2021 20:06:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11AK6Hdn009079 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 10 Feb 2021 15:06:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D72701412A; Wed, 10 Feb 2021 20:06:17 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-117-36.rdu2.redhat.com [10.10.117.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8010860CCC;
	Wed, 10 Feb 2021 20:06:14 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: "Linux-audit@redhat.com" <linux-audit@redhat.com>
Subject: Re: Auditd statsd integration
Date: Wed, 10 Feb 2021 15:06:12 -0500
Message-ID: <3031484.5fSG56mABF@x2>
Organization: Red Hat
In-Reply-To: <CAKo+F=LFA_o2jduY81r52F=hipPTvDEr5LgV5A27x8CKz8WyQQ@mail.gmail.com>
References: <12872550.uLZWGnKmhe@x2>
	<CAKo+F=+h2VXhGfeLzOB7WRqFAiDFgo23m1-Kh5k-=AXbzXWnZA@mail.gmail.com>
	<CAKo+F=LFA_o2jduY81r52F=hipPTvDEr5LgV5A27x8CKz8WyQQ@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wednesday, February 10, 2021 2:11:55 PM EST LC Bruzenak wrote:
> On Wed, Feb 10, 2021 at 1:07 PM LC Bruzenak <lenny@magitekltd.com> wrote:
> > On Mon, Feb 8, 2021 at 7:44 PM Steve Grubb <sgrubb@redhat.com> wrote:
> >> Hello,
> >> 
> >> I have recently checked in to the audit tree 2 experimental plugins. You
> >> can
> >> enable them by passing --enable-experimental to configure. One of the
> >> new
> >> plugins is aimed at providing audit metrics to a statsd server. The idea
> >> being that you can use this to relay the metrics to influxdb, prometheus
> >> or
> >> some other collector. Then you can use Grafana to visualize and alert.
> >> 
> >> Currently, it supports the following metrics:
> >> 
> >> kernel.audit.lost
> >> kernel.audit.backlog
> >> auditd.free_space
> >> auditd.plugin_current_depth
> >> auditd.plugin_max_depth
> >> audit_events.total_count
> >> audit_events.total_failed
> >> audit_events.avc_count
> >> audit_events.fanotify_count
> >> audit_events.logins_failed
> >> audit_events.logins_success
> >> audit_events.anomaly_count
> >> audit_events.response_count
> >> 
> >> I'd be interested in hearing if this would be useful. And if these are
> >> the
> >> right metrics that people are interested in. Should something else be
> >> measured? Should an example Grafana dashboard be included?
> >> 
> >> Let me know what you think.
> >> 
> >> -Steve
> > 
> > Steve,
> > 
> > I think this could be awesome; hoping to give it a try soon. An example
> > dashboard would be very helpful if you could include that.
> > The stats you already point out a good start.
> > 
> > I'd also like to have a way to parse the per-machine kernel-assigned
> > event IDs for missing ones. Might that need a separate plugin for that or
> > could something be done within this setup?

This is not tracking event IDs. I don't think that fits with performance 
metrics. To do this, you'd need to keep track of all events coming in and 
some way of determining what's missing. Which means keeping event state 
around until some timeout just in case a straggler comes through late.


> > I'm pretty sure there are more metrics that would be desired as well as
> > some derived; e.g. take a per-user login/logoff set to identify time
> > spent on a particular machine (screenlocks notwithstanding, but maybe
> > eventually).

I was hoping to hear from people that might currently be using Grafana or 
Graphite to hear if there is anything else needed. Do we need to namespace 
the machines? If so, how is the best way based on experience? Is dot notation 
better or underscores?

As for session time, I wonder if that kind of metric is currently provided by 
other parts of statsd/telegraf?

> > Or perhaps if clients send events+heartbeats, when are they
> > up/down? These are some of the questions I've heard from security
> > overseers.

I suppose it would be easy enough to check the audisp-remote state report for 
it's information.

> > And while some of these may not be inspected directly by the end users,
> > in the case of trouble calls or questions they might be the exact thing
> > I'd ask them to relay to me in order to diagnose a problem or answer a
> > question remotely.

That's the idea with system metrics...to see the system getting in trouble in 
realtime before the user calls. There are other system metrics that can be 
configured into statsd/telegraph and standard dashboards for Linux Server 
metrics. How this differs is that this is statistics specifically aimed at the 
audit daemon.

> ... and I forgot to ask - can you include a README there which specifies
> the minimum kernel/userspace level of code required?

There is no minimal kernel. It does need an audit-3.0 daemon in order to dump 
internal state. However, if it doesn't find the state report, then it simply 
doesn't update those counters. So, in that respect, you could transplant it 
to pretty much any audit daemon.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

