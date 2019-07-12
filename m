Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABBF6735D
	for <lists+linux-audit@lfdr.de>; Fri, 12 Jul 2019 18:34:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 91E9819CF7A;
	Fri, 12 Jul 2019 16:34:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E86D1F8;
	Fri, 12 Jul 2019 16:34:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 37EB31833003;
	Fri, 12 Jul 2019 16:34:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6CGY4GK022392 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 12 Jul 2019 12:34:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6DF6560A9A; Fri, 12 Jul 2019 16:34:04 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 671CE608C2
	for <linux-audit@redhat.com>; Fri, 12 Jul 2019 16:34:01 +0000 (UTC)
Received: from sonic308-13.consmr.mail.gq1.yahoo.com
	(sonic308-13.consmr.mail.gq1.yahoo.com [98.137.68.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1E523C055670
	for <linux-audit@redhat.com>; Fri, 12 Jul 2019 16:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1562949239; bh=PQ/a6XfUa4QIK68bDa5GIo1FTHRwtPeIMmxYHtjj2KQ=;
	h=To:Cc:From:Subject:Date:From:Subject;
	b=jtI/ok1nId9X9BSHbVrQRnqTKx1SzYZq+LY+cnLbF5aZX0Jhl6dh30DbVvfnhbpNzX9GAVH0uGLGuAtXzXt1zoxgFFWrS04gdm8FxgNLSsxcBKA+E564BdiKCqhwDtOu3cf9573ESHuBEpx/LgLqMy5nJfqCdxzNR20T4IIzJSTRkJ0TZt517HuQNRbtex4UR8Y4edJauSzrg/N9aCBWEWxZMbcMh+JFS4dAjhov5bB/wzndMBgQNjfODYMmHnv/ERr7IGeyEKcl4uvZf33JKUFdkGoEWtVRBD8UKA4ltwQn1H69tsAQEEJjvGob89MyKzJ8JFWyIgmxvHFNoOfVDg==
X-YMail-OSG: 6WeUZREVM1lTVj9HtetMbHex3XDbOQozMtGLn2JM5ctV6NcRpHsA2FnxQcAVGXJ
	YdgqjzyiBHYZLEVwpP2ND_cmy4jUqr7WsiRvDsOiFfVANL5q17TJFBejnTZOs9LlauAXKowoT1EH
	6JMzKZTRkudEuRd2aShE2Yq4g.9VzgPGn6XadDv.07ItVLiHpXcnflpDZVV1zc6ZeTflLzy0TKSu
	PhZaeSPrvQs2KHm_9brFdmucJnKYRR1aIvcINgNLQIPW8ur5Wy5IangBudk_vMecQ3XbzHNOnIwj
	p4DH9OEKwz2DFU0ubK5gP5Weoq7ZhthqnsAvmMESeUYPNCyuT.o82rJfjz4Vf5t9.TeplsqFQotX
	0r8Qwj2vcXJKhRoOp2Wa4skp.KBE_A304fYmrAuGr_FFjYTyr9vfmhniR0r6vFagn5rGYleyxZga
	7F1HSa5W6f.W1yGs.rPoV1rKOsoTdQAedbS7Bj0U0itpwEEd2PyLXInBKrH_ioY.IXNV7VRI9r7e
	EB2ryqL5ORH7BaDYJlrd.fOUObqLl2gkTDf6Zr3wV4hD7uzLt6P6DR04DghjSdcYxxeJ5Icv_IRg
	1rL_fcWFZKQzQ3Z4R9qmLvnq13.h1th5NB5SXxfTOQLzr9AfoaNb2Bxl1tZd7ysBq2dmRmEwEIA1
	DwsPlNZs8z9cFEiW_JBe7iGveXo.RWYVMgeFjQgNhvo.vFHLYwsoKIpV93iarz3.uFNgEtXGzEmE
	MYjcE9JipeumlHiGqm8cHYLRh.uT6PlcdTLJGcT56oz3AS3D_rbjrPkLyNQ.XADGwl3860NslrhB
	8pmEw8gXRVAvXCzJkUKNAompAwkLRl8yM7qW2eTvB2f1GJJ4yn0EVUsABrPMx8w8cH9DHqfj36V2
	31qYwlMJv85x67qPIkSiILEij_Lk700KQ863P7UIlEJQ05ebA.cehTPTtoKSzFPGpATXMf9SP5F7
	yfFG0R9OdxAhrACdGW1TWms2gQWDMqf_UMMG9MEJu_t_krDESfa72lIP9xq.Q0o.mIjnZoFG67vC
	gPaLv897tD.YL4C_XwLGqXE2qL5J7sjeeMJVtHKskn_.J_uFb0epz9xu.5FYwzSAr2q5AW6MfYI.
	lRoFJZAXt58.npphfySIFrlLv8K38ATCWTxZYlAed688iGJY9bDUiNCenys5Ejg0Ulpd7zRtLqHm
	kc_QUeaMxiG_7jVySHr6usDucZrWqQByytX2627lQ01a7guhSWaFKgXBIPgO_GtHPH9IEvwVEsyE
	ZBq4qfwxB_Q--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic308.consmr.mail.gq1.yahoo.com with HTTP;
	Fri, 12 Jul 2019 16:33:59 +0000
Received: by smtp427.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID fd07f242e79f673d372d19a532c69c23; 
	Fri, 12 Jul 2019 16:33:57 +0000 (UTC)
To: "linux-audit@redhat.com" <linux-audit@redhat.com>,
	Linux Security Module list <linux-security-module@vger.kernel.org>,
	Paul Moore <paul@paul-moore.com>, rgb@redhat.com,
	Steve Grubb <sgrubb@redhat.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Subject: Preferred subj= with multiple LSMs
Openpgp: preference=signencrypt
Autocrypt: addr=casey@schaufler-ca.com; keydata=
	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
	abzjfg==
Message-ID: <f824828c-5c9d-b91e-5cec-70ee7a45e760@schaufler-ca.com>
Date: Fri, 12 Jul 2019 09:33:55 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.32]); Fri, 12 Jul 2019 16:34:00 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Fri, 12 Jul 2019 16:34:00 +0000 (UTC) for IP:'98.137.68.37'
	DOMAIN:'sonic308-13.consmr.mail.gq1.yahoo.com'
	HELO:'sonic308-13.consmr.mail.gq1.yahoo.com'
	FROM:'casey@schaufler-ca.com' RCPT:''
X-RedHat-Spam-Score: 1.296 * (DKIM_SIGNED, DKIM_VALID, PDS_NO_HELO_DNS,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_NONE) 98.137.68.37 sonic308-13.consmr.mail.gq1.yahoo.com
	98.137.68.37 sonic308-13.consmr.mail.gq1.yahoo.com
	<casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x6CGY4GK022392
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Fri, 12 Jul 2019 16:34:22 +0000 (UTC)

Which of these options would be preferred for audit records
when there are multiple active security modules? I'm not asking
if we should do it, I'm asking which of these options I should
implement when I do do it. I've prototyped #1 and #2. #4 is a
minor variant of #1 that is either better for compatibility or
worse, depending on how you want to look at it. I understand
that each of these offer challenges. If I've missed something
obvious, I'd be delighted to consider #5.

Thank you.

Option 1:

	subj=selinux='x:y:z:s:c',apparmor='a'

Option 2:

	subj=x:y:z:s:c subj=a

Option 3:

	lsms=selinux,apparmor subj=x:y:z:s:c subj=a

Option 4:

	subjs=selinux='x:y:z:s:c',apparmor='a'

Option 5:

	Something else.



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
