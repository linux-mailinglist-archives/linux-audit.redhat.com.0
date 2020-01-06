Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 15C92131A1C
	for <lists+linux-audit@lfdr.de>; Mon,  6 Jan 2020 22:11:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578345105;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PZ9GzOnvi2QI3GsRJs4SKAXA6doZFvgXHmEQihagCbg=;
	b=QY0AIKa8YghBN/gESeeq2W4MoLjYTe9W6w2hBRB3NhAYX5Lb3yqW6azJOjQss6iANJDN8p
	FM47upBbmNE0CzL93lnKZYAbfN0vW5xJnJnjWjmD2ELXwBGn+zaLZ4yGj7IJyYS9ACFhmO
	gTH7minPNieQe7yjk0eiTizbBOGu4M8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-Mx3z2ArPNB6Hxwb4a__Vzw-1; Mon, 06 Jan 2020 16:11:44 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D569107B271;
	Mon,  6 Jan 2020 21:11:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 985C57FB50;
	Mon,  6 Jan 2020 21:11:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6B98818089CD;
	Mon,  6 Jan 2020 21:11:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 006KVTdb000571 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 6 Jan 2020 15:31:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8540020230A6; Mon,  6 Jan 2020 20:31:29 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FC3E202A943
	for <linux-audit@redhat.com>; Mon,  6 Jan 2020 20:31:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E812801E66
	for <linux-audit@redhat.com>; Mon,  6 Jan 2020 20:31:27 +0000 (UTC)
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc
	[193.142.43.52]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-87-2bFcpjIsOmWP5cYZznbdEA-1; Mon, 06 Jan 2020 15:31:25 -0500
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1ioZ23-0006ky-6I; Mon, 06 Jan 2020 21:31:23 +0100
Date: Mon, 6 Jan 2020 21:31:23 +0100
From: Florian Westphal <fw@strlen.de>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH ghak25 v2 3/9] netfilter: normalize ebtables function
	declarations II
Message-ID: <20200106203123.GR795@breakpoint.cc>
References: <cover.1577830902.git.rgb@redhat.com>
	<7df83e229cff2518e73425cdc712505fb773a9c2.1577830902.git.rgb@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7df83e229cff2518e73425cdc712505fb773a9c2.1577830902.git.rgb@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-MC-Unique: 2bFcpjIsOmWP5cYZznbdEA-1
X-MC-Unique: Mx3z2ArPNB6Hxwb4a__Vzw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 006KVTdb000571
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 06 Jan 2020 16:11:25 -0500
Cc: fw@strlen.de, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	twoerner@redhat.com, eparis@parisplace.org, tgraf@infradead.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Richard Guy Briggs <rgb@redhat.com> wrote:
> Align all function declaration parameters with open parenthesis.

Acked-by: Florian Westphal <fw@strlen.de>


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

