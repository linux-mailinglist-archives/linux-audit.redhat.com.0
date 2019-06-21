Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CFC4E8AC
	for <lists+linux-audit@lfdr.de>; Fri, 21 Jun 2019 15:13:43 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 42AFD356EA;
	Fri, 21 Jun 2019 13:12:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08D3D60572;
	Fri, 21 Jun 2019 13:12:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 025973F6E4;
	Fri, 21 Jun 2019 13:12:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5LDBDAN014380 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 21 Jun 2019 09:11:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9E9AF5C22B; Fri, 21 Jun 2019 13:11:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-122-203.rdu2.redhat.com [10.10.122.203])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B51E5C21E;
	Fri, 21 Jun 2019 13:11:07 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: Possible memory leak in auparse_interpret_sock_parts()
Date: Fri, 21 Jun 2019 09:11:07 -0400
Message-ID: <5831426.LfvxvhjaId@x2>
Organization: Red Hat
In-Reply-To: <CAFQMB-Xnu+sLdi=v7ybPYogoa=_zWmkLsAvVpEK3frwXEui6RQ@mail.gmail.com>
References: <CAFQMB-Xnu+sLdi=v7ybPYogoa=_zWmkLsAvVpEK3frwXEui6RQ@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
Cc: Tarun Ramesh <tramesh@acalvio.com>
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Fri, 21 Jun 2019 13:13:42 +0000 (UTC)

On Friday, June 21, 2019 7:34:12 AM EDT Tarun Ramesh wrote:
> Hi,
> 
> In the function auparse_interpret_sock_parts() in auparse/auparse.c, for
> the line:
> const char *val = nvlist_interp_cur_val(r, au->escape_mode);
> 
> I see that the function nvlist_interp_cur_val() eventually calls
> auparse_do_interpretation() which has the comment "Returns a malloc'ed
> buffer that the caller must free"
> The call path is:
> nvlist_interp_cur_val() -> interpret() -> auparse_do_interpretation()
> 
> In auparse_interpret_sock_parts():
> const char *val = nvlist_interp_cur_val(r, au->escape_mode);
> is called and then the value of 'val' is overwritten by:
> val = strstr(tmp, field);
> 
> The initial memory pointed to by 'val' is never freed, which might be a
> memory leak.
> Please let me know if I;m missing something.

nvlist_interp_cur_val() maintains custody of that chunk of memory and frees 
it when the list is cleared. I have a testcase for this and valgrind is 
showing no leaks.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
