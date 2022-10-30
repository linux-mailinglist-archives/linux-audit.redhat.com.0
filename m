Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFD0612CE5
	for <lists+linux-audit@lfdr.de>; Sun, 30 Oct 2022 21:56:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667163389;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ippuocLH6wWqmDonPFm7PqEdNwEDbBmWxTkF73c7CA0=;
	b=aSm0jIcMAHnjfWreEMKhC6hFBM7wYLlzjEiD9JqGwri9T+tedVtdlRWN8AYy/liWcwzAS3
	7oo6vWjrFr++NK+44bVAin+9GIJ/kYIiZCf6WziamOLb2l+GiOW5dDvHVGrAx5r2k6fOMN
	cDFew5wXhok23bU/N/wMn0Rd9aq+iTc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-O7Q1MWEcNSqGgO_av-ijsQ-1; Sun, 30 Oct 2022 16:56:26 -0400
X-MC-Unique: O7Q1MWEcNSqGgO_av-ijsQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7443D3C0ED50;
	Sun, 30 Oct 2022 20:56:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EA8D1492B0E;
	Sun, 30 Oct 2022 20:56:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A19EE19465A0;
	Sun, 30 Oct 2022 20:56:16 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 36E331946589 for <linux-audit@listman.corp.redhat.com>;
 Sun, 30 Oct 2022 20:56:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6767F18EB4; Sun, 30 Oct 2022 20:56:12 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FDB29E70
 for <linux-audit@redhat.com>; Sun, 30 Oct 2022 20:56:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 225F029AA39C
 for <linux-audit@redhat.com>; Sun, 30 Oct 2022 20:56:12 +0000 (UTC)
Received: from sonic310-30.consmr.mail.ne1.yahoo.com
 (sonic310-30.consmr.mail.ne1.yahoo.com [66.163.186.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-477-HcgIdk43PZqAJvn3Ilt8sw-1; Sun,
 30 Oct 2022 16:56:10 -0400
X-MC-Unique: HcgIdk43PZqAJvn3Ilt8sw-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1667163369; bh=eqWKZoDmutbctnW19PgCPQhXS9ht8eJxebvDRUBN7bK=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=lJso/iLXwrVDgxJ7SdWAKTFHhfPIoC20M6ZjEvNApkEoWcm9BNUlCMcWooudR/ttK/Yc+k88D+2dhfYzA4CG9Q59tbYnPtFJ1M0Gq61p66NWIpuN2f7OJzYlhcZcGkOtUBlM5RVUBA0/Qi0RP4jWPnKKEH8rwenQtIJfGrMtxkxe93x1yVp3ELcZMJ6sWUwSN19D2nDnUkBkpNu4+todL6cNT6wms0SuBekNhn2q4O1RnFVEhvjo7XDBDHl7ZCrXpmxog+9cxlalUC6D5d1V7+x6rmJMV1f7xGWlD2ZBFyGKA1LOyyT3SqfReQjan7dm5Trq0MKg2VL1i3JXp6q8eg==
X-YMail-OSG: obSJPGUVM1nKUTdfhSVA6T9KrqS2IfeYqVHdcBgLI4V6ax_NQgmElGOsNGxmLPJ
 HuY0e3QEZAZSk9V_l_93.3xZPZFurRO4fd7epAWfUIjgo5.2wLzDtH6PkctGxNXvyc5j48nGySof
 Y2zmkBFGNCQ5hvahym6EXRsuJA8cCCVEt9zpAfQ.OYTjX5OGTFZWB2hjlTFuK2PoL70q2v_NI4UQ
 eGVa9iKMRcx4oTEPHYM.fG19pzxdbZ7p_fAYDW72HtgRJzlpZBg26lchyHdpDYpelL6eBH1zDv4x
 Dl1mXFZ1.r0gr2bcvH8Ug_kAJqfGcPj0zcxIWfJGVYyd_hJQccS8x6ukwk8wLHHW0GH5XT9djOUL
 c0OCP9bF39nuK4wYHXarKYunVfogf3HsxIchwLqSBzPhrqULnWHwD5imOwrhNGRpsFcjHc.DH9YF
 jYZ.7cGNrnbY0wYJ.6DmC3wtpLLRefF7trCiCAcejGseq3AvUbwkSA_dWnXfr.4p8seHAz2nWMgl
 Zmv_KGFibKSn75xSnbEMrfPU29gIKatjeIBLVPH0NAwfMusyS2P2fS6H3Mi8jG2T1acEyaXzYjoC
 .Nlj4sACNDqpdIaXRuus4YeEkiy.6317TKSM6vai7nGvLQdcguOXYENxQPyIWvDri5sgegVRVIpT
 OG8z.sDv0XPaYcQQLj4S_zRkH6GyCigOTxn4VXBZTEoINRUmsl0elp8qOoFYFPtjqXPHMR..7AzT
 vJ3yYGdnlsdRIkwmYpZmj4qfiPmmXGhHtZYVnw6dDTT.Msh0Re9p0V.wnq4eKaScWjlsKfSS8YVA
 w42TaRN2yopiCv0uWepDrpiQAjqrra.sjRrfIqXQwPXP1zkc8KwoCd6H_ngPEWKNnK3X3SIeCoWu
 zpnfcg92qe7yZLvS6od0nLlGuDegXkY4zSlpS9dV.ey2puLrSlQHYKOAcrFHXjiF6d6TgnAMJAGZ
 4hrcyRcYkL0K7NiRMuzoLZQBOa6F9SyPlLqI8lgSK.mj0ooryL6KtIDAbJObRujhnt6LK0fd40Fs
 KAUpFGublh8b_yDLw5aGFunbuwoHmRg3NqUJFqJ0jrOnygLRMKWx6zxXZw9Tep4TAIP5CY48cYxU
 BXz6_Yom3aCeHiOplb3bHFe49gW7M8odLOxmT6XSVAUpmRxMcxkyXhxIh_dzXOGXWOS3.PqVQmoR
 fysCWF1GU00wGO4qlpLBfeX8cOEmgz9s5WnHR_nq80R3wP6czukjF6NhCytI_aQwsZbGmTwOCWDg
 BWceRTw959ZEFABjMg5_KbcOcoabHv6uWrjPePErFpUXuI2vHdAb81aceDgPdpPD8JMFMGDNFeMn
 6HhkmgSQdLjMWcbRSyeLn7DtctbFJPGjR7WPHFofqvgp1Dq_LwPZQIfZKWrnYUHs7.lrensb8brw
 5735_18vxd3tPVJHclztHYQ8SEGL454Klt1qsGepnD0DJUbhnOQp8_r_5SO0qIrvtZsLtTWuxAuB
 WTfUJarTXaApaXDU3NQCiWBshkSIfsxpCylBynnOehkz8tcE_MGgUBcY1KPX1giOPDUAMC2V.1bs
 MEp5ba0eRD_3n4dj29BuuihuhMDFScVaiibUvywJgsr.KVmJPSX46EF.v1Dpe4umYrW8gPp6n2tk
 SdlphnZTRoQ4F3hHEmbwWbFc0uKvK0Aw0Vdx4A1enQWZ4IwNRqzQylRqr45YqK4vihMlBut0zbUN
 oua8Vvdwj.3leYqXWiGlxROYQFlUTgB5DKEoMszlv2G0nCMsmMZLWVTaIAAYJpQF6x40omYxhzaR
 fLIQmIV0vDCWffZ77tyFG6L5lpkg.dl.tNN5VgZv0RRBxIiW0H6zMXBFGNGrR1Scq8tYM7xbmoFw
 4LzSGTl.GPIoJGyDf8VGkAv8m7m0UuXjBo6jE1nBSFxsoOEhgzKsBQz.epQY6PkShMV3_0d0syxQ
 f5hphTeyGkUtxVM7SM_4pb.B3EqAn7saxwN6_acSGgqnAcQzC2.Fc7nxzoL4_oRMT9iqPKISn9uu
 bMyQm587D.V8Epx_dDN7qYc3uWP7A54wBNmb112L7mXcHWt_OyS2oAkho0spvtvpNSx4LK4aoxS0
 bG7FFkBBnJ29PSKRwT4zN_I4ijgHiNLgPqPi_OtdIMea0vsw_G8JIs3vGSt0B_iigSur0oxlFEAW
 jsOPeGw362_fDduAHWciG_y4I3AqVrgr0zTQYZOHB_stOK3SwUgZqTkBOMHJeHQoFO5s6IKo371s
 tvX8_yU1TMTfSC.zc_PNsA1w2mT798ts5oUt0D4LCktFQhu2an50R12JRnUZPAd2igGR34pJPWu1
 41NrvfZNa7GU-
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.ne1.yahoo.com with HTTP; Sun, 30 Oct 2022 20:56:09 +0000
Received: by hermes--production-bf1-64dccd5d47-k9w9h (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID dfb5cb9de7f4a7b6d2752ff60d0ac423; 
 Sun, 30 Oct 2022 20:56:05 +0000 (UTC)
Message-ID: <90a125bc-310d-e938-df2c-1338b9301075@schaufler-ca.com>
Date: Sun, 30 Oct 2022 13:56:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: LSM stacking in next for 6.1?
To: Kees Cook <kees@kernel.org>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 John Johansen <john.johansen@canonical.com>, Paul Moore <paul@paul-moore.com>
References: <791e13b5-bebd-12fc-53de-e9a86df23836.ref@schaufler-ca.com>
 <cc14bbde-529e-376c-7d27-8512ec677db3@schaufler-ca.com>
 <ff43e254-0f41-3f4f-f04d-63b76bed2ccf@I-love.SAKURA.ne.jp>
 <1a9f9182-9188-2f64-4a17-ead2fed70348@schaufler-ca.com>
 <2225aec6-f0f3-d38e-ee3c-6139a7c25a37@I-love.SAKURA.ne.jp>
 <5995f18c-5623-9d97-0aa6-5f13a2a8e895@I-love.SAKURA.ne.jp>
 <77ec837a-ff64-e6f0-fe14-a54c1646ea0b@canonical.com>
 <0fcc5444-a957-f107-25a1-3540588eab5a@I-love.SAKURA.ne.jp>
 <11564f69-3bba-abf7-eb46-06813ff4a404@schaufler-ca.com>
 <98ab33d6-6c91-9c0a-8647-22f6bdede885@I-love.SAKURA.ne.jp>
 <aa201ed7-9ca1-9507-08cc-156f280ee5f4@schaufler-ca.com>
 <3266c2c2-cd7e-bc0f-0fc4-478a63d6ee77@I-love.SAKURA.ne.jp>
 <f7548061-e82d-9a39-ed15-0d32551b4099@canonical.com>
 <53b07579-82f5-404e-5c2c-de7314fff327@I-love.SAKURA.ne.jp>
 <aa5424f3-05a6-530b-bf5f-19e5421f8f3f@canonical.com>
 <2c48a481-391f-85c7-be4f-13bbc1553aac@I-love.SAKURA.ne.jp>
 <AB202AC7-9C8D-4109-B4EA-87A7BC1BADF8@kernel.org>
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <AB202AC7-9C8D-4109-B4EA-87A7BC1BADF8@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: keescook@chromium.org, SElinux list <selinux@vger.kernel.org>,
 James Morris <jmorris@namei.org>, Mimi Zohar <zohar@linux.ibm.com>,
 LSM List <linux-security-module@vger.kernel.org>, linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/30/2022 9:37 AM, Kees Cook wrote:
> On October 30, 2022 7:02:52 AM PDT, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp> wrote:
>> Casey's patchset is trying to provide LSM ID Repository for userspace programs.
>> But an LSM ID value cannot be assigned to that LSM unless that module is
>> available in the upstream kernel. This means that, developers are not allowed
>> to develop a new LSM module even with the intention to become available in the
>> upstream kernel, for there always is a risk of LSM ID collision which the LSM ID
>> Repository should have avoided from the beginning. Also, this means that, unlike
>> PCI devices, users are not allowed to use out-of-tree LSM modules which have to
>> remain out-of-tree due to proposed-but-not-accepted by the upstream kernel.
>> This is a serious bug; is LSM a proprietary/closed code where modification is
>> impossible due to an End-User License Agreement?
> You are way off in the weeds with false equivalencies.
>
>> You have only three choices:
>>
>>  (1) allow assigning LSM ID integer value to all LSM modules (regardless of
>>      whether that module was merged into upstream kernel)
> We are not hardware manufacturers.
>
>>  (2) use module name string value as LSM ID
> This results is greater code complexity. If you see a way to do this, send a patch. Instead of unhelpfully saying "no, do it differently", show a solution.
>
>>  (3) dynamically assign LSM ID integer value when an LSM module is registered
> Again, send a patch.
>
>> There never is fourth choice:
>>
>>  (4) assigning LSM ID integer value to only LSM modules which were merged
>>      into upstream kernel
>>
>> The fourth choice is complete lockout of out of tree projects.
> This is just not a real outcome. How is this any different from syscalls, capability bits, prctl values, ELF flags, etc?
>
Loadability and the LSM ID are completely separate issues. Show me a patch
that implements loading modules and I will show you how to change it to
accommodate the LSM ID. That is, if it isn't obvious at that point.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

