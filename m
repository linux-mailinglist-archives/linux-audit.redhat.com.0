Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 55D0F3145C4
	for <lists+linux-audit@lfdr.de>; Tue,  9 Feb 2021 02:44:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612835097;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=m+zpOXQLHxZ85kerQAwEircFIo8TWM0761bW2Yoo/ZU=;
	b=azQ19xcEmwKz5U2/io7PX0tI0iRXjhT7OPsahNKPAXaGWFMZ/PGOU4MnWomggz8eYmkJ1+
	B/vCTg8clWFqvyt7C8IQSHqZzulSzn6tQwKd/VorSRtmwFSXKkpzYKHA4mjWE1OCUtwbaE
	cOoJv8WasTNE3NgS2bPvPeGvECNS3k0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-bXlkBk_yMRSwETqRiNHnIA-1; Mon, 08 Feb 2021 20:44:55 -0500
X-MC-Unique: bXlkBk_yMRSwETqRiNHnIA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13A3B107ACC7;
	Tue,  9 Feb 2021 01:44:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4700D6F13B;
	Tue,  9 Feb 2021 01:44:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3E8EE4E58D;
	Tue,  9 Feb 2021 01:44:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1191i3tp003126 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 8 Feb 2021 20:44:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 73AB160C05; Tue,  9 Feb 2021 01:44:03 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-113-33.rdu2.redhat.com [10.10.113.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 40F6A60C04
	for <linux-audit@redhat.com>; Tue,  9 Feb 2021 01:44:00 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Auditd statsd integration
Date: Mon, 08 Feb 2021 20:43:59 -0500
Message-ID: <12872550.uLZWGnKmhe@x2>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

Hello,

I have recently checked in to the audit tree 2 experimental plugins. You can 
enable them by passing --enable-experimental to configure. One of the new 
plugins is aimed at providing audit metrics to a statsd server. The idea 
being that you can use this to relay the metrics to influxdb, prometheus or 
some other collector. Then you can use Grafana to visualize and alert.

Currently, it supports the following metrics:

kernel.audit.lost
kernel.audit.backlog
auditd.free_space
auditd.plugin_current_depth
auditd.plugin_max_depth
audit_events.total_count
audit_events.total_failed
audit_events.avc_count
audit_events.fanotify_count
audit_events.logins_failed
audit_events.logins_success
audit_events.anomaly_count
audit_events.response_count

I'd be interested in hearing if this would be useful. And if these are the 
right metrics that people are interested in. Should something else be 
measured? Should an example Grafana dashboard be included?

Let me know what you think.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

